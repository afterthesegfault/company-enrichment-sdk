import { VoxgigOpenapiSpecEntityBase } from '../VoxgigOpenapiSpecEntityBase';
import type { VoxgigOpenapiSpecSDK } from '../VoxgigOpenapiSpecSDK';
import type { Control } from '../types';
import type { GetCompanyEnrichment, GetCompanyEnrichmentListMatch } from '../VoxgigOpenapiSpecTypes';
declare class GetCompanyEnrichmentEntity extends VoxgigOpenapiSpecEntityBase<GetCompanyEnrichment> {
    constructor(client: VoxgigOpenapiSpecSDK, entopts: any);
    make(this: GetCompanyEnrichmentEntity): GetCompanyEnrichmentEntity;
    list(this: any, reqmatch?: GetCompanyEnrichmentListMatch, ctrl?: Control): Promise<GetCompanyEnrichmentEntity[]>;
}
export { GetCompanyEnrichmentEntity };
