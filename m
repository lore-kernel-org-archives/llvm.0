Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42412154A9
	for <llvm@lists.linux.dev>; Mon, 22 May 2023 16:29:52 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-64d3578c25bso3966332b3a.3
        for <llvm@lists.linux.dev>; Mon, 22 May 2023 09:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684772991; x=1687364991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FAkKcxK0XGy2Mfzb+3G4ZZig1suIGlcPXW3ZGdiAVSA=;
        b=gKMZ7XX4R2VVh8UsICMu0Rsyke0XrW2c+iRdHHRt3WLWOycJO32Iy04zCNODgFfd4R
         D4saMqcStc+sMP83KAqZHxF2yw/+92d97pUSNL7+DK5dQh/BOcnBAvDWU4hq8cJ8XihR
         OQLsKlHjjTFnvdXZubmLG44LfUVnxjSa3p52hs0BL3K4cwahT81s2Hx9+Bdv0qu7aLbF
         ypDYOKDI/6neL9kriVO66DUnXuCexjPu/JMQ3Be9CuN3HLdNfGmSa68Haud473dFlm6G
         uHkL8p193PWUoqP27x/gjhz+62Sa43tbwWREDY4bohSEJx4mwzjNkV4JO3kgrnBTjdwE
         e0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684772991; x=1687364991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAkKcxK0XGy2Mfzb+3G4ZZig1suIGlcPXW3ZGdiAVSA=;
        b=IY1c2AuJ9Ecoi/Dfz4/ajd4qsPZo0WWTZuMStk5AJZ87XVah480VTDaoZjN2hdysA0
         3bYgBvv8/nvDVV88JhOTQkOElyMg4rciIRX/FDlk4/s3sUT/9DmVVV07gCuBpPW5EgAu
         vtSOMhRE6bSgv+zIcuc9jPGcRQOCv451C2yhbmgdeqP+nSkoKz7XSXE3Trj+vFFj/DAu
         RZVAA/2Sk4i4clMjkfNiZTYrSVhuXtwWW4jUDcFzCQeJ2f9iqEZSDSpToyeqt5bQsVlD
         yLteKhODPFWgjCiM1VW+kmnzpEjLpEz994KJGnrbbizMwX5z9+GWbqR2S22rKlqPM5vW
         czsQ==
X-Gm-Message-State: AC+VfDxqlk8k7bIX7FbvQAXjroDendlRhAH7dQaeDCJXdqdZcP91pXnB
	5BTK1TwXlW4EjDJixQhpnY6d4g==
X-Google-Smtp-Source: ACHHUZ5GdkVEPhjfb0wo1cG4veSdeV7NVtA9Usryrtr3shd7i6atVl1mHOPkqK3UwqkqrLKZFvovrA==
X-Received: by 2002:a05:6a00:1307:b0:64b:256:204c with SMTP id j7-20020a056a00130700b0064b0256204cmr14436082pfu.20.1684772991208;
        Mon, 22 May 2023 09:29:51 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:f7a6:d766:a921:add2])
        by smtp.gmail.com with ESMTPSA id r14-20020a63514e000000b0050f93a3586fsm4597933pgl.37.2023.05.22.09.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 09:29:50 -0700 (PDT)
Date: Mon, 22 May 2023 09:29:44 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
	Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <ZGuYeDA9jDlxzfZN@google.com>
References: <20230522171557.32027acf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522171557.32027acf@canb.auug.org.au>

On Mon, May 22, 2023 at 05:15:57PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the amdgpu tree, today's linux-next build (arm allmodconfig
> clang-17) failed like this:
> 
> drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c:146:54: error: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Werror,-Wformat]
> 
> Caused by commit
> 
>   d020a29b6b58 ("drm/amdgpu: Allocate GART table in RAM for AMD APU")
> 
> Reported by the kernelci.org bot.

Alex,
This is the third report of linux-next being broken for clang due to the
AMDGPU tree.
1. https://lore.kernel.org/lkml/20230522171557.32027acf@canb.auug.org.au/
2. https://lore.kernel.org/lkml/20230522171145.38a8bd4d@canb.auug.org.au/
3. https://lore.kernel.org/lkml/20230522170031.5fb87a64@canb.auug.org.au/

Our CI is red as a result.
https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/5045716034/jobs/9053211936

When will AMD start testing their kernels with Clang?

> 
> -- 
> Cheers,
> Stephen Rothwell

Thanks for reporting these, Stephen.
