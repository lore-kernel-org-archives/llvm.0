Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A82A37EFE4
	for <llvm@lists.linux.dev>; Tue, 14 Apr 2026 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776174699; cv=none; b=kiBtC4TLor3QrS8vBqh1Ee1NwrYAErZb6TjFQeOSjUyeIGOf9dhLHKU8JpOcOhETP8kRw8XEBsRFGfEel+QOpLnp0kg4KPOZDlDpAQlKFcW8J9wN6SUL03LJlZ8yqaasvQ2mweiZMGgG9ZnbP8nctd+ec/DAZ2MVyq+wt6Xh3kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776174699; c=relaxed/simple;
	bh=NLSlLrSMZI3cUmOb7DTz8GAbCCesV31zq8QSjsFga28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AlLvf9L+IsJGPa6O/WY+hq/fRAnjlelPtWxW3jU1gGo02yvdMl6jqV5NPCJE9mGY+7bjmfdnkntYB9GZHuOJikQjqHhvxd89D8/Pmpf6nokTf/NzyYXHsfagNpoCHr+8+nX5ROeSv7gghu9tB0GGtxVbLst3owNUux0Ucl9KD3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BoSub6dR; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BoSub6dR"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67210f0cd01so154821a12.2
        for <llvm@lists.linux.dev>; Tue, 14 Apr 2026 06:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776174697; x=1776779497; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YPz3m1xG2VmGGvoQqOrcAUr+iF4l5uhVzIGYSCshb3I=;
        b=BoSub6dR9pcQ4Ti0RZUSBi1dGGiEp8rbfIviFovs6wW+cHX9DyGybl7MyzjXoxAc68
         fGAARsOKreU7uDIT6cBN5NeBaOgN4jhnGGaGKIQ7FB/k/gy3aloK0GZ2a6PidSKg0ulR
         pZ5ceqEnWERg1XadwK8fOFQZPjafqlwffuRRUs9iXaWeYdZrpHp1Nz6Pp1vnMH12PgMX
         goYORsPiWZbaIKz5FtRdzKc7YPsTSYa4qzVik6GwE0Qum0wG3zTUnjGj8hheOrJh53pn
         HLpET4Mkwgw6teosDNU0jbJSGkOygbCmpHWE/2ol238/flrY2fN2nxoLMEWxYLt3mETp
         nmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776174697; x=1776779497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPz3m1xG2VmGGvoQqOrcAUr+iF4l5uhVzIGYSCshb3I=;
        b=RE2ljJh5bn7YQB3xg9c7YTapSly++kM7VXYlRbIm3PXFNvm5h1DMWvfdohr/AKlBB8
         aDPOiUnMJ5vhISBRjvs6l43vWf0n0M1DdYjWutDLmGDqYyOuYiaconHdA6DGdwonixgg
         HxKbKNZ8TfJabu9SIbR2mpLopi1uqvhthjvGGZXiYdoXg39eWzWkAqk7lfEJz1e2E9jG
         opc/e6thFxG5zpnVsLuyrTKOPRz+dQx5R8qiAl264YFs/o0D7InzW6TGCezJypOASiwt
         GTm0L2C6DOBQkCMjgMkbU1UfPKWA4npbGZNkB4vC3vTNg/FBd1S8kEYlor3dy+X9/k/i
         rGvw==
X-Forwarded-Encrypted: i=1; AFNElJ+C+Z7hoOzHI9fU+NSxcXKsI3kI2SUghmnNfWBzRWxA/9MyUoj1NBl0/wv84CnwEOct+1g/@lists.linux.dev
X-Gm-Message-State: AOJu0YzQr51Lc1KtG0qRbf8aSZSPigHsnZYudCrHTIb8RP8PNwVqjqx0
	lSVP6ZbWaRNk1CBRhXkLeGXbF7JUCrU2MNzVmRjY/Ff5v9vcLMjphGMB7DA6gmQrmY0=
X-Gm-Gg: AeBDiesv2Z8YEvRVbp8IyMre/Ckptg/kZ8+7v08N4xcEWuv6JCh1M8/jOOpcpkW6KpS
	1xgIh5X54pf1hKgttzV5Gi3Hmjc/GsnVjDoMcXwqoMdUbm3gtnnBPt+GdXYfM9sn071y+74PCr+
	DwFjHm/V3DATE1Px0Fa3NjabmxqtvZU+uVFZ+bko0XKTmCyDrTCew1FcWKbYAER6GGHdLI3PB3z
	scUzhi8Earbjic1JqGHQc8BGGPW5aa8Rv+mw/Dj7OAbv8dH7NJ7x2qxWbP8Mvz+sZkwHq0MePin
	Utb7FADrTmF/dOEGQJqlREM3vQh+td5zlJ6lPldA+F2PfRj/S+oGlrD4hRdg6U4krwu2HghEjRx
	HqNPrskg7EKpy3hRxQxfhJZInXzVb5mpSqMFeHzcYEPE+jkO0Wj8M37GYZAszq6KwPnIBqFIKpn
	ui2EXIt02fqNxIQ7KDYuBCgt08P0hWjoxql8Mx0anQ
X-Received: by 2002:a05:6402:46cd:b0:670:2678:680f with SMTP id 4fb4d7f45d1cf-670786a3684mr5764211a12.5.1776174696416;
        Tue, 14 Apr 2026 06:51:36 -0700 (PDT)
Received: from [172.17.16.20] ([213.137.22.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670703f1340sm3248786a12.10.2026.04.14.06.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 06:51:35 -0700 (PDT)
Message-ID: <774cb091-cc24-420d-8cc6-88780746bceb@linaro.org>
Date: Tue, 14 Apr 2026 14:51:34 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/16] perf capstone: Fix arm64 jump/adrp disassembly
 mismatch with objdump
To: Tengda Wu <wutengda@huaweicloud.com>
Cc: Bill Wendling <morbo@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Zecheng Li <zli94@ncsu.edu>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>,
 Namhyung Kim <namhyung@kernel.org>, leo.yan@linux.dev,
 Li Huafei <lihuafei1@huawei.com>, Ian Rogers <irogers@google.com>,
 Kim Phillips <kim.phillips@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>
References: <20260403094800.1418825-1-wutengda@huaweicloud.com>
 <20260403094800.1418825-3-wutengda@huaweicloud.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260403094800.1418825-3-wutengda@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/04/2026 10:47, Tengda Wu wrote:
> The jump and adrp instructions parsed by libcapstone currently lack
> symbolic representation and use a '#' prefix for addresses. This
> format is inconsistent with objdump's output, which causes subsequent
> parsing in jump__parse() and arm64_mov__parse() to fail.
> 
> Example mismatch:
>    Current: b #0xffff8000800114c8
>    Fix:     b ffff8000800114c8 <el0t_64_sync+0x108>
> 
>    Current: adrp x18, #0xffff800081f5f000
>    Fix:     adrp x18, ffff800081f5f000 <this_cpu_vector>
> 
> Fix this by implementing extended formatting for these arm64
> instructions during symbol__disassemble_capstone(). This ensures
> the output matches objdump's expected style, including the raw
> address and the associated <symbol+offset> suffix.
> 
> Signed-off-by: Tengda Wu <wutengda@huaweicloud.com>
> ---
>   tools/perf/util/capstone.c | 107 ++++++++++++++++++++++++++++++++-----
>   tools/perf/util/disasm.c   |   5 ++
>   tools/perf/util/disasm.h   |   1 +
>   3 files changed, 101 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/perf/util/capstone.c b/tools/perf/util/capstone.c
> index 25cf6e15ec27..1d8421d2d98c 100644
> --- a/tools/perf/util/capstone.c
> +++ b/tools/perf/util/capstone.c
> @@ -255,10 +255,6 @@ static void print_capstone_detail(struct cs_insn *insn, char *buf, size_t len,
>   	struct map *map = args->ms->map;
>   	struct symbol *sym;
>   
> -	/* TODO: support more architectures */
> -	if (!arch__is_x86(args->arch))
> -		return;
> -
>   	if (insn->detail == NULL)
>   		return;
>   
> @@ -305,6 +301,98 @@ static void print_capstone_detail(struct cs_insn *insn, char *buf, size_t len,
>   	}
>   }
>   
> +static void format_capstone_insn_x86(struct cs_insn *insn, char *buf,
> +				     size_t len, struct annotate_args *args,
> +				     u64 addr)
> +{
> +	int printed;
> +
> +	printed = scnprintf(buf, len, "       %-7s %s",
> +			    insn->mnemonic, insn->op_str);
> +	buf += printed;
> +	len -= printed;
> +
> +	print_capstone_detail(insn, buf, len, args, addr);
> +}
> +
> +static void format_capstone_insn_arm64(struct cs_insn *insn, char *buf,
> +				       size_t len, struct annotate_args *args,
> +				       u64 addr)
> +{
> +	struct map *map = args->ms->map;
> +	struct symbol *sym;
> +	char *last_imm, *endptr;
> +	u64 orig_addr;
> +
> +	scnprintf(buf, len, "       %-7s %s",
> +		  insn->mnemonic, insn->op_str);
> +	/*
> +	 * Adjust instructions to keep the existing behavior with objdump.
> +	 *
> +	 * Example conversion:
> +	 * From: b #0xffff8000800114c8
> +	 * To:   b ffff8000800114c8 <el0t_64_sync+0x108>
> +	 */
> +	switch (insn->id) {
> +	case ARM64_INS_B:
> +	case ARM64_INS_BL:
> +	case ARM64_INS_CBNZ:
> +	case ARM64_INS_CBZ:
> +	case ARM64_INS_TBNZ:
> +	case ARM64_INS_TBZ:
> +	case ARM64_INS_ADRP:

Hi Tengda,

Is this supposed to be an exhaustive list of branches? If so using 
something like an is_branch() function might help make it work for new 
instructions with only an update to capstone. I don't know if capstone 
has a function like that but I did see it had instruction group types:

	// Generic groups
	// all jump instructions (conditional+direct+indirect jumps)
	ARM64_GRP_JUMP,	///< = CS_GRP_JUMP
	ARM64_GRP_CALL,
	ARM64_GRP_RET,
	ARM64_GRP_INT,
	ARM64_GRP_PRIVILEGE = 6, ///< = CS_GRP_PRIVILEGE
	ARM64_GRP_BRANCH_RELATIVE, ///< = CS_GRP_BRANCH_RELATIVE

> +		/* Extract last immediate value as address */
> +		last_imm = strrchr(buf, '#');
> +		if (!last_imm)
> +			return;
> +
> +		orig_addr = strtoull(last_imm + 1, &endptr, 16);
> +		if (endptr == last_imm + 1)
> +			return;
> +
> +		/* Relocate map that contains the address */
> +		if (dso__kernel(map__dso(map))) {
> +			map = maps__find(map__kmaps(map), orig_addr);
> +			if (map == NULL)
> +				return;
> +		}
> +
> +		/* Convert it to map-relative address for search */
> +		addr = map__map_ip(map, orig_addr);
> +
> +		sym = map__find_symbol(map, addr);
> +		if (sym == NULL)
> +			return;
> +
> +		/* Symbolize the resolved address */
> +		len = len - (last_imm - buf);
> +		if (addr == sym->start) {
> +			scnprintf(last_imm, len, "%"PRIx64" <%s>",
> +				  orig_addr, sym->name);
> +		} else {
> +			scnprintf(last_imm, len, "%"PRIx64" <%s+%#"PRIx64">",
> +				  orig_addr, sym->name, addr - sym->start);
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +static void format_capstone_insn(struct cs_insn *insn, char *buf, size_t len,
> +				 struct annotate_args *args, u64 addr)
> +{
> +	/* TODO: support more architectures */
> +	if (arch__is_x86(args->arch))
> +		format_capstone_insn_x86(insn, buf, len, args, addr);
> +	else if (arch__is_arm64(args->arch))
> +		format_capstone_insn_arm64(insn, buf, len, args, addr);
> +	else {
> +		scnprintf(buf, len, "       %-7s %s",
> +			  insn->mnemonic, insn->op_str);

This is the same in three places. Maybe it could be a 
print_default_format() function.

> +	}
> +}
> +
>   struct find_file_offset_data {
>   	u64 ip;
>   	u64 offset;
> @@ -381,14 +469,9 @@ int symbol__disassemble_capstone(const char *filename __maybe_unused,
>   
>   	free_count = count = perf_cs_disasm(handle, buf, buf_len, start, buf_len, &insn);
>   	for (i = 0, offset = 0; i < count; i++) {
> -		int printed;
> -
> -		printed = scnprintf(disasm_buf, sizeof(disasm_buf),
> -				    "       %-7s %s",
> -				    insn[i].mnemonic, insn[i].op_str);
> -		print_capstone_detail(&insn[i], disasm_buf + printed,
> -				      sizeof(disasm_buf) - printed, args,
> -				      start + offset);
> +		format_capstone_insn(&insn[i], disasm_buf,
> +				     sizeof(disasm_buf), args,
> +				     start + offset);
>   
>   		args->offset = offset;
>   		args->line = disasm_buf;
> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
> index 40fcaed5d0b1..988b2b748e11 100644
> --- a/tools/perf/util/disasm.c
> +++ b/tools/perf/util/disasm.c
> @@ -202,6 +202,11 @@ bool arch__is_powerpc(const struct arch *arch)
>   	return arch->id.e_machine == EM_PPC || arch->id.e_machine == EM_PPC64;
>   }
>   
> +bool arch__is_arm64(const struct arch *arch)
> +{
> +	return arch->id.e_machine == EM_AARCH64;
> +}
> +
>   static void ins_ops__delete(struct ins_operands *ops)
>   {
>   	if (ops == NULL)
> diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
> index a6e478caf61a..d3730ed86dba 100644
> --- a/tools/perf/util/disasm.h
> +++ b/tools/perf/util/disasm.h
> @@ -111,6 +111,7 @@ struct annotate_args {
>   const struct arch *arch__find(uint16_t e_machine, uint32_t e_flags, const char *cpuid);
>   bool arch__is_x86(const struct arch *arch);
>   bool arch__is_powerpc(const struct arch *arch);
> +bool arch__is_arm64(const struct arch *arch);
>   
>   extern const struct ins_ops call_ops;
>   extern const struct ins_ops dec_ops;

