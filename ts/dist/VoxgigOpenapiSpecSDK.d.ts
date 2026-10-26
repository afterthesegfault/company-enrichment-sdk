import { GetCompanyEnrichmentEntity } from './entity/GetCompanyEnrichmentEntity';
import { PostCompanyEnrichmentEntity } from './entity/PostCompanyEnrichmentEntity';
export type * from './VoxgigOpenapiSpecTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { VoxgigOpenapiSpecEntityBase } from './VoxgigOpenapiSpecEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
type DirectResult = {
    ok: false;
    err: any;
    status?: undefined;
    headers?: undefined;
    data?: undefined;
} | {
    ok: boolean;
    status: number;
    headers: any;
    data: any;
    err?: any;
};
declare class VoxgigOpenapiSpecSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<DirectResult>;
    _rawRequest(fetchargs?: any): Promise<DirectResult>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    GetCompanyEnrichment(entopts?: Record<string, any>): GetCompanyEnrichmentEntity;
    PostCompanyEnrichment(entopts?: Record<string, any>): PostCompanyEnrichmentEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): VoxgigOpenapiSpecSDK;
    tester(testopts?: any, sdkopts?: any): VoxgigOpenapiSpecSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof VoxgigOpenapiSpecSDK;
export { stdutil, config, BaseFeature, VoxgigOpenapiSpecEntityBase, VoxgigOpenapiSpecSDK, SDK, };
export type { DirectResult };
