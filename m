Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795155270;
	b=ZTuMnqGy/Q/57ouaLWvOEXzc8iayn7r+w6E3+NyH4JZc7VfSD3hhzTvmXSWE6drDWFQR
	 hBfSr6QjNhQ9ypjijXSTSLvtCuIO0TQPK9jX84jVinZnFJd7XeyA4YVsEZv7Zdiz1w7Wa
	 NjsajDIa2UpZYje6Iu11pbW6a9FwZBRrqlvIRjixsMievlG22NjgVzleh+u0uxNw9/B7c
	 IFEgS01p9mpC5KKa87AuY9jQcqnuj9SkG4Nlwyg0U/x2Qrv+w3ZHzJ+TJoTWLNYANoIHL
	 ftJ530j4Bn51ko92IQ5KqHiwHfx0Ku1/TygQ2XWB7biYLIesC+CE8XVql/ezur2kbdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795155270;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=uIBu8HqPy2ZDIPlH3cQZ0K+BG3JbZzw5F/6JfmjHzVQ=;
	b=2m5v1PREDjeY38VnV6RhKZhqzLmdNzSGLVWg+1TQr/MmS26eOgVgUU1/jCMQHc4Ht0bL
	 CRSY6ztx69F+hnMAzFZ9GloTCuG4zczGalrLPOFV2pZ1y/M5z+hMZAjzQaDA4eDxQDVuf
	 wpd8sKo9foBbDnZM1ErAP0rLv6qj3R+hZJsbc9bsVPlWl9DrfwNsLSsOAtQ2v6IoV+tFx
	 Pfmkiz5yH/IdwBFib4Q8AconHFSPZQCvtLvVxq49/HkqCLUzKqljFUzxuRLwELPjLEYl1
	 hVoLx2+YOYEZuk6nXo6VMgbqjIphQHp8jar6eTasq3cRg/8TePsg6gMqJfrqNFYlgug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=DZNN88oW;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25355606A50F
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 06:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25355606A50F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=DZNN88oW
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uIBu8HqPy2ZDIPlH3cQZ0K+BG3JbZzw5F/6JfmjHzVQ=;
	b=DZNN88oWXSaciObWaLk4XpRLGIRDtUuFFuLCgmK+Ols9qjyPbtVROiUBQn+oak1MnJ3K+yFMz
	ICDnAMM3cKAQR0rgknPWOyEHD7VvL9jpzh7KiikJbLvSdhYrMhGncGrnr0ffuA8m8Cck4z/rB2X
	lziJz+qe+ASppMjs2ohAMLY=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jW4mK4DdpzKmSg;
	Fri, 20 Nov 2026 14:14:09 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 1EF924056C;
	Fri, 20 Nov 2026 14:14:25 +0800 (CST)
Received: from [10.174.177.171] (10.174.177.171) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 20 Nov 2026 14:14:23 +0800
Message-ID: <9671bd14-dc54-41e1-8c7e-91920409b646@huawei.com>
Date: Fri, 20 Nov 2026 14:14:22 +0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubifs: widen compr_type bitfields and guard uncompiled
 compressors
To: Ian Rogers <irogers@google.com>, Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, Elkin Cruz <elkin@google.com>
References: <20261119170455.1514058-1-irogers@google.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
In-Reply-To: <20261119170455.1514058-1-irogers@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo200011.china.huawei.com (7.152.185.179)



在 2026/11/20 1:04, Ian Rogers 写道:
> Commit eeabb9866e4c ("ubifs: Add support for zstd compression.") added
> UBIFS_COMPR_ZSTD (3), raising UBIFS_COMPR_TYPES_CNT to 4. However,
> compr_type in struct ubifs_inode and struct ubifs_mount_opts, as well as
> default_compr in struct ubifs_info and struct ubifs_fs_context, remained
> 2-bit unsigned bitfields (0..3). Because ubifs_read_superblock() and
> ubifs_iget() store 16-bit on-flash __le16 compressor IDs into those 2-bit
> bitfields before validate_sb() and validate_inode() check
> '>= UBIFS_COMPR_TYPES_CNT', out-of-range on-flash compressor IDs silently
> wrap modulo 4 and render both validation checks dead code.
> 
> In addition, when an inode uses a valid compressor that is disabled in
> Kconfig (!compr->capi_name, compr->cc == NULL), validate_inode() only
> logs a warning and allows the inode to be opened, but
> ubifs_compress_common() lacks ubifs_decompress_common()'s !compr->capi_name
> check and passes NULL compr->cc into crypto_acomp_compress() on write.
Nice catch.
> 
> Widen all four compression-type bitfields from 2 bits to 16 bits to match
> the __le16 on-flash fields (fitting within existing 32-bit bitfield groups
> without increasing any structure size), update the BUILD_BUG_ON() in
> ubifs_init(), and fall back to uncompressed data with a warning in
> ubifs_compress_common() if compr_type is invalid or not compiled in.
> 
> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
> -Wtautological-value-range-compare enabled; fix and changelog drafted with
> an AI coding assistant. Verified with a standalone C bitfield/layout test
> and build-tested across fs/ubifs/ under LLVM=1 W=1 and
> -Wtautological-value-range-compare; not runtime-tested on a mounted UBIFS
> volume.
> 
> Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
> Fixes: eeabb9866e4c ("ubifs: Add support for zstd compression.")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   fs/ubifs/compress.c | 26 ++++++++++++++++++++------
>   fs/ubifs/super.c    | 11 ++++++-----
>   fs/ubifs/ubifs.h    |  6 +++---
>   3 files changed, 29 insertions(+), 14 deletions(-)

Tested-by: Zhihao Cheng <chengzhihao1@huawei.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
> 
> diff --git a/fs/ubifs/compress.c b/fs/ubifs/compress.c
> index 059a02691edd..c5c21d30d846 100644
> --- a/fs/ubifs/compress.c
> +++ b/fs/ubifs/compress.c
> @@ -73,11 +73,12 @@ static struct ubifs_compressor zstd_compr = {
>   /* All UBIFS compressors */
>   struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_TYPES_CNT];
>   
> -static void ubifs_compress_common(int *compr_type, union ubifs_in_ptr in_ptr,
> -				  size_t in_offset, int in_len, bool in_folio,
> -				  void *out_buf, int *out_len)
> +static void ubifs_compress_common(const struct ubifs_info *c, int *compr_type,
> +				  union ubifs_in_ptr in_ptr, size_t in_offset,
> +				  int in_len, bool in_folio, void *out_buf,
> +				  int *out_len)
>   {
> -	struct ubifs_compressor *compr = ubifs_compressors[*compr_type];
> +	struct ubifs_compressor *compr;
>   	int dlen = *out_len;
>   	int err;
>   
> @@ -88,6 +89,19 @@ static void ubifs_compress_common(int *compr_type, union ubifs_in_ptr in_ptr,
>   	if (in_len < UBIFS_MIN_COMPR_LEN)
>   		goto no_compr;
>   
> +	if (unlikely(*compr_type < 0 || *compr_type >= UBIFS_COMPR_TYPES_CNT)) {
> +		ubifs_warn(c, "invalid compression type %d, leave data uncompressed",
> +			   *compr_type);
> +		goto no_compr;
> +	}
> +
> +	compr = ubifs_compressors[*compr_type];
> +	if (unlikely(!compr->capi_name)) {
> +		ubifs_warn(c, "%s compression is not compiled in, leave data uncompressed",
> +			   compr->name);
> +		goto no_compr;
> +	}
> +
>   	dlen = min(dlen, in_len - UBIFS_MIN_COMPRESS_DIFF);
>   
>   	do {
> @@ -154,7 +168,7 @@ void ubifs_compress(const struct ubifs_info *c, const void *in_buf,
>   {
>   	union ubifs_in_ptr in_ptr = { .buf = in_buf };
>   
> -	ubifs_compress_common(compr_type, in_ptr, 0, in_len, false,
> +	ubifs_compress_common(c, compr_type, in_ptr, 0, in_len, false,
>   			      out_buf, out_len);
>   }
>   
> @@ -184,7 +198,7 @@ void ubifs_compress_folio(const struct ubifs_info *c, struct folio *in_folio,
>   {
>   	union ubifs_in_ptr in_ptr = { .folio = in_folio };
>   
> -	ubifs_compress_common(compr_type, in_ptr, in_offset, in_len, true,
> +	ubifs_compress_common(c, compr_type, in_ptr, in_offset, in_len, true,
>   			      out_buf, out_len);
>   }
>   
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 38972786817e..cca1b459d978 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -1019,7 +1019,7 @@ struct ubifs_fs_context {
>   	char *auth_hash_name;
>   	unsigned int no_chk_data_crc:1;
>   	unsigned int bulk_read:1;
> -	unsigned int default_compr:2;
> +	unsigned int default_compr:16;
>   	unsigned int assert_action:2;
>   };
>   
> @@ -2424,12 +2424,13 @@ static int __init ubifs_init(void)
>   	BUILD_BUG_ON(UBIFS_REF_NODE_SZ != 64);
>   
>   	/*
> -	 * We use 2 bit wide bit-fields to store compression type, which should
> -	 * be amended if more compressors are added. The bit-fields are:
> +	 * We use 16 bit wide bit-fields to store compression type, matching
> +	 * the 16-bit on-flash fields. The bit-fields are:
>   	 * @compr_type in 'struct ubifs_inode', @default_compr in
> -	 * 'struct ubifs_info' and @compr_type in 'struct ubifs_mount_opts'.
> +	 * 'struct ubifs_info' and 'struct ubifs_fs_context', and @compr_type
> +	 * in 'struct ubifs_mount_opts'.
>   	 */
> -	BUILD_BUG_ON(UBIFS_COMPR_TYPES_CNT > 4);
> +	BUILD_BUG_ON(UBIFS_COMPR_TYPES_CNT > (1 << 16));
>   
>   	/*
>   	 * We require that PAGE_SIZE is greater-than-or-equal-to
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index b85b45a0564b..f2511f866c38 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -406,7 +406,7 @@ struct ubifs_inode {
>   	unsigned int dirty:1;
>   	unsigned int xattr:1;
>   	unsigned int bulk_read:1;
> -	unsigned int compr_type:2;
> +	unsigned int compr_type:16;
>   	struct mutex ui_mutex;
>   	struct rw_semaphore xattr_sem;
>   	spinlock_t ui_lock;
> @@ -948,7 +948,7 @@ struct ubifs_mount_opts {
>   	unsigned int bulk_read:2;
>   	unsigned int chk_data_crc:2;
>   	unsigned int override_compr:1;
> -	unsigned int compr_type:2;
> +	unsigned int compr_type:16;
>   };
>   
>   /**
> @@ -1311,7 +1311,7 @@ struct ubifs_info {
>   	unsigned int encrypted:1;
>   	unsigned int no_chk_data_crc:1;
>   	unsigned int bulk_read:1;
> -	unsigned int default_compr:2;
> +	unsigned int default_compr:16;
>   	unsigned int rw_incompat:1;
>   	unsigned int assert_action:2;
>   	unsigned int authenticated:1;

