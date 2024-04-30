Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0E138C
	for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 00:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714436274; cv=none; b=BrdjbJTz5EzxPisikBn9jAhDn0YH5HoK/xVrEnWiRIJ4beFo5lW9Za9Mx6f7MCT8uYPeEqL/Ve9DflRv8F3YPYJIlKGJSPUlEDtbgL1SqzNZSAhlHSLnzO4W9ufNNrdgBizlF3MU1osJRgtNTIWbB/Q4zRcc0mhxhHA//x04juM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714436274; c=relaxed/simple;
	bh=zcQMVubjuiX7aI5h+1mB/JKiS+LzDcsoiUn13gUVidY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q1Ga2T5YXV8qKFSn8IqEsW39TfDboFsf+yrDZ85/oIWQ96daznXyq5+DvS7gs1olblDuOiFIteJyOu/VSVqs3rRwBAft8F1yCrSjsCPwVQpyIhdLcTOkCAZDcBjeTWRlhIolJtyE8VKeOdtCTMMAFvQQDfjQQuaanzIfnSkQ+OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uhB1CyLb; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uhB1CyLb"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-36c481a28e7so6858435ab.0
        for <llvm@lists.linux.dev>; Mon, 29 Apr 2024 17:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714436272; x=1715041072; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wwskn8wHob0aiuWt7oahW5gvmqR22bCIIQzL1vy/1Vk=;
        b=uhB1CyLb6GuCtdFLQ8zk+FdR22G7c2jKLDVxHANzDLaAxpDuehPtVt+9zoMu53n/JV
         ECkUZivKb+gVnPt6jqA9w2hZAYibjfJIQSRtzLePTe0VFK9xR4EvNuf2utILnmcyi13M
         sEzmkVvhQ5cRW9ApItJmbTHVY96N0jrPvlq5gCo9XmLbyAEJ0Pb7e9P6ZmnSZPZ5XEGv
         u49KqsCMcfCZWGk9T2A+uqVVHWiGevTXSBQhoS73OD6l8ZyJaMKhGl3rMARwGLcZ8cf7
         tol5HOxV7v0HMbbAPmpye90rZbLGWudoaVf0bqKGxo3MHVGChdGRALw8w2EWGZgUYAQi
         fHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714436272; x=1715041072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wwskn8wHob0aiuWt7oahW5gvmqR22bCIIQzL1vy/1Vk=;
        b=nwH3mkAL9d3wflfS52UapADDFj9Q80kDmHnIOk6qEIwezb9mp/PsYGAs9pxj3HBQHZ
         OujlOZvoDExQea3xQZsEMKa4bg54ODcyEJ+ZXs61n8nIaf0cxTzn+pchXv0LkxYymnSX
         zE6LJ0PSzs0Pj4oa0Lxbg4uFIwuNua0PvGwNBozwavHT5JLa68QomWbtvmYlO2hNFzia
         0sUhk6nelxgx04VlTedYAMELemaaY5I1d1D4MLLUGvKFlddg62cvbTUqSd+iunpJYMUU
         AyWvFhP9I4hnSzkldMiw3sG5PSsdhrc+y3dIDQ20sAqfVuYjkzm/x1+4rEgn2NSR3n7u
         QYyA==
X-Forwarded-Encrypted: i=1; AJvYcCUPEStUEX/yRbofAyqC9CFCdVcimoG5uDLOdFGLTwyIb/BXlLy154OM5rh7SSv8KGCxTtg9tJ01TVkoDn1zj3x6wnSNPw==
X-Gm-Message-State: AOJu0YwhF4gxcFsz1mNg277rgn3WmX/T0C1FERSVvVJOkebKWfcfeOBK
	fRzZZKlDL4MFSphyH71EKq+O5CQEr5pmyR8tmfJ9GyaHRRH3cYnP/k2oepRqGg==
X-Google-Smtp-Source: AGHT+IH9ZpHbIbR+PH37031tfohQuWl2RhYefdfEjAqVtOPnbjU6itGtSPkwvvkahLjNm79OM9oG9g==
X-Received: by 2002:a05:6e02:1aa3:b0:36c:442f:9590 with SMTP id l3-20020a056e021aa300b0036c442f9590mr1155822ilv.13.1714436272103;
        Mon, 29 Apr 2024 17:17:52 -0700 (PDT)
Received: from google.com (195.121.66.34.bc.googleusercontent.com. [34.66.121.195])
        by smtp.gmail.com with ESMTPSA id bv7-20020a056638448700b004874ea2e03csm2369644jab.124.2024.04.29.17.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 17:17:51 -0700 (PDT)
Date: Tue, 30 Apr 2024 00:17:46 +0000
From: Justin Stitt <justinstitt@google.com>
To: Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, "H. Peter Anvin" <hpa@linux.intel.com>, 
	Andy Lutomirski <luto@mit.edu>, linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	llvm@lists.linux.dev
Subject: Re: [PATCH] selftests/vDSO: Fix assignment in condition without
 parentheses
Message-ID: <mwrlqn2ddkepz6ayksk562uloq3ksejf3vu4i5xaoz2xnj6cl6@mwuquhhp3lwj>
References: <20240429203441.143607-1-edliaw@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429203441.143607-1-edliaw@google.com>

On Mon, Apr 29, 2024 at 08:34:36PM +0000, Edward Liaw wrote:
> Fixes clang compiler warnings by adding parentheses:
> 
> parse_vdso.c:65:9: warning: using the result of an assignment as a condition without parentheses [-Wparentheses]
>                 if (g = h & 0xf0000000)
>                     ~~^~~~~~~~~~~~~~~~
> parse_vdso.c:65:9: note: place parentheses around the assignment to silence this warning
>                 if (g = h & 0xf0000000)
>                       ^
>                     (                 )
> parse_vdso.c:65:9: note: use '==' to turn this assignment into an equality comparison
>                 if (g = h & 0xf0000000)
>                       ^
>                       ==
> 
> Fixes: 98eedc3a9dbf ("Document the vDSO and add a reference parser")
> Signed-off-by: Edward Liaw <edliaw@google.com>

For readability's sake, I tend to prefer just taking the assignment out
of the if statement:

g = h & 0xf0000000;
then testing it:
if (g) ...

but as it stands it's fine and the warning goes away.

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  tools/testing/selftests/vDSO/parse_vdso.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/vDSO/parse_vdso.c b/tools/testing/selftests/vDSO/parse_vdso.c
> index 413f75620a35..b9cf771006da 100644
> --- a/tools/testing/selftests/vDSO/parse_vdso.c
> +++ b/tools/testing/selftests/vDSO/parse_vdso.c
> @@ -62,7 +62,7 @@ static unsigned long elf_hash(const unsigned char *name)
>  	while (*name)
>  	{
>  		h = (h << 4) + *name++;
> -		if (g = h & 0xf0000000)
> +		if ((g = h & 0xf0000000))
>  			h ^= g >> 24;
>  		h &= ~g;
>  	}
> -- 
> 2.44.0.769.g3c40516874-goog
> 
