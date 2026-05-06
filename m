Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF323D333C
	for <llvm@lists.linux.dev>; Wed,  6 May 2026 23:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778111000; cv=none; b=sVrG4wEpbWnkburt6J3Zmy0r08PWThPrbNZ0u7J/KWOozuZ6BSk7miwT+npSOxlBDGyVJhC6iZU3kCwTBHyG7wVogQsFUQkSHdS5gPOVurMAc0v7De8BdElY3AODKiVdp91obU+ukjK0j/TKSe3vy9B6BBtboG0W2yCBH2sz5qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778111000; c=relaxed/simple;
	bh=VrhtxDHUUeFu0o5VmnJwmZF5v65oeWz1aqO85RgV8C8=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=eza3/T+MFIwE+4oFnG/KkKLBDCVXGUWmWEY5DtVLFhXjs/lbSfIpwvcMKExKQ0dCq9nxAElHUPsvm1pj3UvG4RFv7l/HroqZ+/HfeMgDkYp0aowYce2cQD/bXFiS3UB7y+cXYDefkQgi+yi60R8VSia2Uy8R47uLufgPjhzjZYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Bduc7So9; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Bduc7So9"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8c70b5594f4so28229285a.1
        for <llvm@lists.linux.dev>; Wed, 06 May 2026 16:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1778110996; x=1778715796; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JoTC/lw/OUWxpldadyRFLcKS56uCYY4dboDv240sPdE=;
        b=Bduc7So9zpnhBVHwKsCA+VIsVbo+MFIgQx8CL8dIJGhSUGIK8JcfpQ77X6T5dwUr4Y
         bfkUvbZfUdec+IcKQXQ2bqxGxYnAESutUIZamtU4GUofthurO4vzuDKN+yWGC+KEBaxU
         5ZnMp61IHwMy4W5Czlspeo9aDCThMcnnMAbggjkR7PQm2hjLc+OA1fZlj9ggGtciFMo2
         0dNjyGdXZjNOo7PKnr2ravDspErBrDMW7PMyS5h0tVdICqoaxPu0i3Mdz/ViIt7FtzIC
         y0tn1/he+97nz5D6E350w6CydcuXX6wK6YwrTe4susqwEApqL6bFnxr35FPXhdItJSx7
         GxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778110996; x=1778715796;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JoTC/lw/OUWxpldadyRFLcKS56uCYY4dboDv240sPdE=;
        b=jxmtTo/DFuw+bkcctXjsBrSbW/UI4vqdDx3Py08efJphB379oTLfNzX3owIEE6jziF
         WVwhMmqZxSJoZb/JmxGTvukeanml+OLh4ICwnlXIE6MXhPDLJTfMdCVgF/9t/v7/xmUc
         4Y63urplOpkwN8uWTYNeSuQHsIm9J9WGePBx7bd3WFyL53zo9g0jzS9sFkrG2dsYM3fO
         O7UP+xI7ClAfi70mlvklr/7vTaKgO31mtNLHErPi0lklvwAZb5wssQguWZoCdpLYO8/n
         ecxCnsLkU5ooauuJzpbcfqwKU4dDOoKSXDBcmf6c19eEBQxtesVEWH1yDXhWVMqfQsVJ
         H84w==
X-Forwarded-Encrypted: i=1; AFNElJ+iQpW/vkcOpLMYkMXqK742SmtiEuI3Ycx8ehi9N0t7zRMoX6Z2XAAWczw+u+0WE2HrFBCu@lists.linux.dev
X-Gm-Message-State: AOJu0Yzw/iu3SRH86LYujqFKtHsmE5bE2fbfS2/ijbrVo99UPYoqxFSa
	s7krpxOwVYBg0aKpx2D0wtpinf/a7p9xg/DMuE2SVTNTEiER4NsSEDu3FTOAES81tg==
X-Gm-Gg: AeBDieukupx+yEmF64HH8+Cnk4U8mbvk9nc0feU7QF07kymxdnFa/oho5YhIlbcegmH
	qv2CjR6Qcm2KlOBfWcNWLnF9HimVCJFFJxPGuvh1k/suLHP5wfptr3ncYGIDaeG57K4BpIX2o0c
	hDCrmPzoCr5TIYbBBMQlagtiRaS9kY0YZ5P59VCMmBiQH1fcx1EcFQd9t4Kwwl8Xw4jhG4PII1+
	QZ48ZRBcxQkciXI/LaOoOIopszzc2JI9G/sTRodPD739y4ANA65eOTLKGHZDdQbd0skKGKJojNL
	6sSIPEfTmbHLwQ+R9QucPiHZx8Xdge897Dt0826eB/NqdBlCurs3K9r7lYEfOZQydy1bkSaWchM
	2SINUlV8Zn+kezalBLurjpXBh9u2pklZoSnrtR8/OGrqg4MIeScxPQLCpmoSkJNZPQEoFyu8TSM
	YQv9zm9EBPDFH8ApeWTNtBOkKWazNMlIj/iJEts4rx4Uu1S/MOb/18cQXLPiTnnth0vwSa6q+US
	bo6p2z19dfJcOMr8w==
X-Received: by 2002:a05:620a:45a6:b0:8d6:6db0:88de with SMTP id af79cd13be357-90653728e7emr91239285a.44.1778110995685;
        Wed, 06 May 2026 16:43:15 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c1dc62csm211275276d6.23.2026.05.06.16.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 16:43:14 -0700 (PDT)
Date: Wed, 06 May 2026 19:43:14 -0400
Message-ID: <ba12d905fe53bfee14017bc3353144af@paul-moore.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260506_1600/pstg-lib:20260506_1556/pstg-pwork:20260506_1600
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>, selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Subject: Re: [PATCH v3 10/14] selinux: validate symbols
References: <20250511173055.406906-10-cgoettsche@seltendoof.de>
In-Reply-To: <20250511173055.406906-10-cgoettsche@seltendoof.de>

On May 11, 2025 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> Some symbol tables need to be validated after indexing, since during
> indexing their referenced entries might not yet have been indexed.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> ---
>  security/selinux/ss/policydb.c | 94 ++++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)

...

> diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
> index f8d6e993ce89..4559c8918134 100644
> --- a/security/selinux/ss/policydb.c
> +++ b/security/selinux/ss/policydb.c
> @@ -765,6 +843,16 @@ static int policydb_index(struct policydb *p)
>  		if (rc)
>  			goto out;
>  	}
> +
> +	for (i = 0; i < SYM_NUM; i++) {
> +		if (!validate_f[i])
> +			continue;
> +
> +		rc = hashtab_map(&p->symtab[i].table, validate_f[i], p);
> +		if (rc)
> +			goto out;
> +	}

Is there a reason why we need a second loop to do the validation?  Can we
simply do the validation in the indexing loop above this?

  for (i = 0; i < SYM_NUM; i++) {
    p->table[i] = kvcalloc(...);

    hashtab_map(p->table, index_f[i]);

    if (validate_f[i])
      hashtab_map(p->table, validate_f[i]);
  }

--
paul-moore.com
