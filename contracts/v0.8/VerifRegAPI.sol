/*******************************************************************************
*   (c) 2022 Zondax AG
*
*  Licensed under the Apache License, Version 2.0 (the "License");
*  you may not use this file except in compliance with the License.
*  You may obtain a copy of the License at
*
*      http://www.apache.org/licenses/LICENSE-2.0
*
*  Unless required by applicable law or agreed to in writing, software
*  distributed under the License is distributed on an "AS IS" BASIS,
*  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*  See the License for the specific language governing permissions and
*  limitations under the License.
********************************************************************************/
//
// DRAFT!! THIS CODE HAS NOT BEEN AUDITED - USE ONLY FOR PROTOTYPING
//
pragma solidity >=0.4.25 <=0.8.17;

import "./types/VerifRegTypes.sol";
import "./cbor/VerifRegCbor.sol";

import "./utils/Actor.sol";

/// @title FIXME
/// @author Zondax AG
contract VerifRegAPI {
    using GetClaimsCBOR for VerifRegTypes.GetClaimsParams;
    using GetClaimsCBOR for VerifRegTypes.GetClaimsReturn;
    using AddVerifierClientCBOR for VerifRegTypes.AddVerifierClientParams;
    using RemoveExpiredAllocationsCBOR for VerifRegTypes.RemoveExpiredAllocationsParams;
    using RemoveExpiredAllocationsCBOR for VerifRegTypes.RemoveExpiredAllocationsReturn;
    using ExtendClaimTermsCBOR for VerifRegTypes.ExtendClaimTermsParams;
    using ExtendClaimTermsCBOR for CommonTypes.BatchReturn;
    using RemoveExpiredClaimsCBOR for VerifRegTypes.RemoveExpiredClaimsParams;
    using RemoveExpiredClaimsCBOR for VerifRegTypes.RemoveExpiredClaimsReturn;
    using UniversalReceiverHookCBOR for VerifRegTypes.UniversalReceiverParams;
    using UniversalReceiverHookCBOR for VerifRegTypes.AllocationsResponse;

    function get_claims(VerifRegTypes.GetClaimsParams memory params) public returns (VerifRegTypes.GetClaimsReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(VerifRegTypes.GetClaimsMethodNum, VerifRegTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        VerifRegTypes.GetClaimsReturn memory response;
        response.deserialize(result);

        return response;
    }

    function add_verified_client(VerifRegTypes.AddVerifierClientParams memory params) public {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(VerifRegTypes.AddVerifierClientMethodNum, VerifRegTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        return;
    }

    function remove_expired_allocations(
        VerifRegTypes.RemoveExpiredAllocationsParams memory params
    ) public returns (VerifRegTypes.RemoveExpiredAllocationsReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(VerifRegTypes.RemoveExpiredAllocationsMethodNum, VerifRegTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        VerifRegTypes.RemoveExpiredAllocationsReturn memory response;
        response.deserialize(result);

        return response;
    }

    function extend_claim_terms(VerifRegTypes.ExtendClaimTermsParams memory params) public returns (CommonTypes.BatchReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(VerifRegTypes.ExtendClaimTermsMethodNum, VerifRegTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        CommonTypes.BatchReturn memory response;
        response.deserialize(result);

        return response;
    }

    function remove_expired_claims(
        VerifRegTypes.RemoveExpiredClaimsParams memory params
    ) public returns (VerifRegTypes.RemoveExpiredClaimsReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(VerifRegTypes.RemoveExpiredClaimsMethodNum, VerifRegTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        VerifRegTypes.RemoveExpiredClaimsReturn memory response;
        response.deserialize(result);

        return response;
    }

    function universal_receiver_hook(
        VerifRegTypes.UniversalReceiverParams memory params
    ) public returns (VerifRegTypes.AllocationsResponse memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(VerifRegTypes.UniversalReceiverMethodNum, VerifRegTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        VerifRegTypes.AllocationsResponse memory response;
        response.deserialize(result);

        return response;
    }
}
