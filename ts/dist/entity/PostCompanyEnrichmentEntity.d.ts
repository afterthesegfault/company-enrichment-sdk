import { VoxgigOpenapiSpecEntityBase } from '../VoxgigOpenapiSpecEntityBase';
import type { VoxgigOpenapiSpecSDK } from '../VoxgigOpenapiSpecSDK';
import type { Control } from '../types';
import type { PostCompanyEnrichment, PostCompanyEnrichmentCreateData } from '../VoxgigOpenapiSpecTypes';
declare class PostCompanyEnrichmentEntity extends VoxgigOpenapiSpecEntityBase<PostCompanyEnrichment> {
    constructor(client: VoxgigOpenapiSpecSDK, entopts: any);
    make(this: PostCompanyEnrichmentEntity): PostCompanyEnrichmentEntity;
    create(this: any, reqdata?: PostCompanyEnrichmentCreateData, ctrl?: Control): Promise<PostCompanyEnrichmentEntity>;
}
export { PostCompanyEnrichmentEntity };
