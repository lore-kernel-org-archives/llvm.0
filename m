Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655838;
	b=wu7O+QFS0thRytFQZea/HfwzbnRvEvxWKr8LY38GkQr0PB/DwUlcH7SCB/OvVwufN5Ox
	 8XK9ADliIW5uXNNA0x3KoS3MWJ0a3LbhnZ/R8v9+8Bh6hd8X8lPn5htiKsBaFkZMsqGM5
	 pvpPe2Cozs+R4zUIycI99WUJZVNK6KD53Zqhfwlu7y4W0qe8ZeDhDowvxemqgVZ0YHeHn
	 QD0sbyDloTU7QllvIK6ZTRIfzP+UFUOZ/kCFp9TJ+S0jOpIr6Tet/ei2GdfTde9hRVEAx
	 yArXGDxfvbbGSCBH58HYqknkpyR3Z9ZkdAzr+QnqABE+0CYmxbtDqgrFbiV5HjtmBCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8vhDEbyn1nkYBGZ2jl97YuxcDAz2vqULbU/VOeX9XGM=;
	b=zq+PT834ULEpF4TCBfXfUQeMhjIJaC79ZHIx2TxKSf1hyvmFcKJR7cZVx5Ow95cFqjBY
	 FRfbTBHT+eK06YK+3rDCI9TiFN/AQwqv6EIFisb0K7njWa1rYpbvz+DinmeTJ1ciPFcT9
	 qp8xiTJpFUALINjGONnTNxgg527az5g47LiCnNuIr6aaReZpmmS1753zV9asFjae3M0z5
	 LUfPVnwpMz/+Y9sxVPGmYya4IrHzBx32hnmOul3LrrJWppeOseQdnyqtWK4ZS2F0Cgv0Y
	 OlB2P4Sab66l1Zv/oG281q6s87WXEBhYfr2xSokQbprHoxZF5ehhUCbuQMiUBazVxRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WcStPNn+;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B634606A31E
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 01:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B634606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WcStPNn+
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso1214224866b.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 17:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795655836; x=1796260636; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8vhDEbyn1nkYBGZ2jl97YuxcDAz2vqULbU/VOeX9XGM=;
        b=WcStPNn+KFzkHr4MmE8wt6l+y6W0yGVoifpbF3LjcFQVxqmcPbzUvG5dty8QgdQSaE
         JpMLXgDjx6y04MOAmJbxlcdQCuHXNmyfmcBG3yzSRxCQuYx62NTzY0y4vb4zpmupSa1Y
         V4hWnPslb3iCKRcovdZX6r8FsGp5BTI3mmVnNWThII5z8jQydGv0WT/5s7QNrU3cCpHy
         ae6QDIPz4AIhwUEkbqeAsToEQSY2LapPmBgfHqqIKSNBw1MYFoDEluMNFv0MYA8pNuve
         B/knfUVa91haveVbmCCm5mm9K6HI7NSIoZl7geM1rwMGwWEAkHNSMa22P9fbLuiw4tZX
         kUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655836; x=1796260636;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8vhDEbyn1nkYBGZ2jl97YuxcDAz2vqULbU/VOeX9XGM=;
        b=H6y5i/NWOx2dXIv2s94KsklTX1LI3TidRcF6cCCuyeEsmKtDN4FM9rxUH8BzF6k7X3
         0QQkv5CDwGAVMR5FOMV/uJQ6fnVnjtRpKEpOyFzYTtUVpRqNsf8zom8hHmz+qVTBLBRn
         QIKy4IS5Rk6wZIdYU6beDjbLUJ0Hq38+pVCypu0py9L+lLWjbcuKnxeX3cj6Zhfo7ABt
         q4aIzRiJWAnotsRlMce2hfTVf3QR1GrxG/qdVI1/ohQpmeByZSI9AEE8XCn22KYR+RMP
         kNgEBP3A2ywH2QMyb2smrxwbPt+NUNo02WklT7CLIKhDcAlWACLJiLHmB5mXuW/vB923
         ZOuA==
X-Forwarded-Encrypted: i=1; AL+hErFjs5izwVClo5rJqUeFcTjIf//qHZpfLBGJmkl1wQZFvKiDCFUlol3rp5KJQNNXZtusGC2g@lists.linux.dev
X-Gm-Message-State: APuU4Z/2UqP+mbs3XXQpoMW+5ZbgaZ4kTSn14qOIxb2v/wUDaauSCeyT
	bkpU+Tp5c3hf53ZvrTS+odr5YQuIcQ0bzagLJPOZPn4JIRcA3UVs2QBe/7HQUkpmkiE=
X-Gm-Gg: AZFdTZc4LOX53zVdzJbsg+Snw1BVSstK/9IYjn7p7T076NFNExJioG2XIKi20On0H0+
	rBMjGDQmztqp9bgs1jiTKbifhMLguPYjwbXKmspYZDSqHKaWlbJcFWmYnXX6gUg6pQ2ftMd0gj2
	97r/1pcFkSk9HYx37rgnM12I3fh13Ff1ADtSZnyfzbuvrK3yoMAzllmaOjUb8bebxny2daPY1tQ
	PlwfOQZyMwwnkyHN9S9hVY8mqCpkx8wPOEi9xt/b/nukk/xc6nRMwfyeCU3V7W3UU9k6ckEAFHU
	qX1XkpN1Hjeu34hKjiWzoHAUP0uocL/l3MCWqNIUpkS2N1jFizsM8Te0hqWrnmwNMFVa4UPnPcn
	6GZ1jJAgHOZpD225b2SRqDSF6PFg/8Sn1RfcAu9dYMtt4Rz4RZgLY2f8U5hMnAHYROH3juHj2An
	rmetwFXP1US3O79nMZxDu2NMZeHgZfKm5Cs6iGqTwZRVkxXntspgeWjEdcAkBBdULcj8MAmGFTG
	5nERfecga4xiEc0OjsZUHN5PMWuwRMuQ8aKitIFCqYlp2etZnBDkUVq/4yFXMGwxErA/3OuG67G
	396tpmKjB3T0JAjxc8TzEPpFIoOcN3tfX7SjHMwcVu8=
X-Received: by 2002:a17:906:730a:b0:c2e:1b6b:8b19 with SMTP id a640c23a62f3a-c51319443e5mr1859065766b.23.1795655835781;
        Wed, 25 Nov 2026 17:17:15 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cff4c1asm9716494a12.15.2026.11.25.17.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 17:17:13 -0800 (PST)
Message-ID: <03dd7e64-2357-4e8a-9383-d748b4883efa@suse.com>
Date: Thu, 26 Nov 2026 11:47:02 +1030
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
Subject: Re: [PATCH v2] btrfs: tree-checker: verify tree_block_info bounds in
 check_extent_item()
To: Elkin Cruz <elkin@google.com>, David Sterba <dsterba@suse.com>,
 Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Chris Mason <mason@kernel.org>, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com,
 stable@vger.kernel.org
References: <20261126004332.1712403-1-elkin@google.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ujyBQkUpLw5AAoJEMI9kfOh
 Jf6o8OIH/0mqW+TQM4m2x3hCsnK+oB4yJH1qnGvIhFF/Lhs48wI02sGh6/4aA0hkCDfd9LHQ
 +ci4FUepZ9y4VS01+oIExbg/8ytzGYTzLtb44jK2GBOBVSJkMiha6jp22XFt7WUkT/tvbreu
 WWdGsaJIRQaZChy7xsMI8lqQ2WdmluZJ4LT0wD3l/l6QU1ZseMGySebdY9sVOQEOJNV7Qj92
 /KOAFNmeZshV/qDI8Iw1RTs6TvLqCcqmlZLCmJkYSVhT1RonWRren8xIRcFEgMe004IDnt7V
 qdQhk/nhTS9x9MBAhMRl0TTE1VKDLvVALsud3iZLrmmtYvwPApzGJk052f0m28vOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ukKBQkUzDspAAoJEMI9kfOhJf6o
 SNsH/1ysUWOKmzY0rGS3ZdS61QgqMGhSWD/EJ4UiPw+xO4l4+GtX0fOAqxqsmBKqje3vyhBa
 Z5o/1Y+gNiN+E6RBcSz4b1TAd78sQ2bvT5DWOvBjeeVxHdiuQMIn4S8xk5ZpySBw5ifjoiuL
 0M33UVtJOzM8yfAeL+d/Rp4leJw72SutjkLyZTG/gJIp4pJGD/kFHn24OLL0IxEcO0gOekNZ
 os5e1R6jAJ2ILk7+MDnvU8wXHcCiVzuDhJLI1tih1uUIE50muHQJWbYuVBbdJeu8WlIDDssx
 UOCxLylNG3gDXV5MhLubPTOpp9OiFc/XC37nvkgEcrlmlOFBv4/NJCbECpo=
In-Reply-To: <20261126004332.1712403-1-elkin@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/26 11:13, Elkin Cruz 写道:
> check_extent_item() only verifies item_size >= sizeof(*ei) before
> reading struct btrfs_tree_block_info on non-skinny tree block extent
> items (BTRFS_EXTENT_ITEM_KEY with BTRFS_EXTENT_FLAG_TREE_BLOCK). A
> crafted filesystem image with 24 <= item_size < 42 causes
> btrfs_tree_block_level() to read past the item and potentially past the
> extent buffer's populated folios.
> 
> Verify ptr + sizeof(*info) <= end before accessing
> btrfs_tree_block_info, matching the inline ref bounds checks below.
> 
> Fixes: f82d1c7ca8ae ("btrfs: tree-checker: Add EXTENT_ITEM and METADATA_ITEM check")
> Cc: stable@vger.kernel.org
> Signed-off-by: Elkin Cruz <elkin@google.com>

Reviewed-by: Qu Wenruo <wqu@suse.com>

Will push to for-next soon.

Thanks,
Qu

> ---
> 
> Changes in v2:
> - Use (ptr + sizeof(*info) > end) with matching extent_err() format to
>    follow the existing pattern in check_extent_item(), thanks to Qu
>    Wenruo for the review.
> 
> v1: https://lore.kernel.org/r/20261125221849.1424464-1-elkin@google.com
> 
> I am trying out new Clang static analysis checks for kernel bug
> classes, and they flagged this code as possibly buggy. The findings
> were triaged/fixed and commit descriptions were drafted with help of AI,
> then checked against linux-next (not runtime-tested on hardware).
> 
> Thanks,
> Elkin
> 
>   fs/btrfs/tree-checker.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
> index d2bf21c7b848..40f2355cbb1d 100644
> --- a/fs/btrfs/tree-checker.c
> +++ b/fs/btrfs/tree-checker.c
> @@ -1665,6 +1665,12 @@ static int check_extent_item(struct extent_buffer *leaf,
>   	if (is_tree_block && key->type != BTRFS_METADATA_ITEM_KEY) {
>   		struct btrfs_tree_block_info *info;
>   
> +		if (unlikely(ptr + sizeof(*info) > end)) {
> +			extent_err(leaf, slot,
> +				   "tree block info overflows extent item, ptr %lu info size %zu end %lu",
> +				   ptr, sizeof(*info), end);
> +			return -EUCLEAN;
> +		}
>   		info = (struct btrfs_tree_block_info *)ptr;
>   		if (unlikely(btrfs_tree_block_level(leaf, info) >= BTRFS_MAX_LEVEL)) {
>   			extent_err(leaf, slot,

