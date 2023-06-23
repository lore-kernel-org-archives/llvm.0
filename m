Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE3A100B3
	for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 17:18:00 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-666ecf9a081so682510b3a.2
        for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 10:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687540680; x=1690132680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LfbqvLK9Qfv4YF15RNhH25UogTHD/trEiy3T/djOfaI=;
        b=xOUmQpxHu7os+Nl9EESJkSZpvheHF8R0/sK0BJUwzYmbVPkrFsxgP0foSUrW6iU4aq
         UF3xAkqE/VQAdENo2u2TZQK4mAiELlsY6HtfQ43Cm8EmQg1yaSwXCM5MBtld7piogO6f
         +EhhdZef5ZKc8DVOi+seiGnsx3r8I2oEXhtM37lXnlpfMEFseJyRe83uUgPhvd+REw1j
         PJBVzSmoaqCMXKyOoBrT+HjbScoIx8Uva/BygNV9SPRldIqdXvoicmEGg06guAEaRYaC
         /P1XRwjnSw2pdUekcxWt35N5S23ReO09GHZaQGrQcOWzcAuU/4vfBkzun4QRLzoP07Ye
         bvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687540680; x=1690132680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfbqvLK9Qfv4YF15RNhH25UogTHD/trEiy3T/djOfaI=;
        b=hojL07VQEC/vMzxDOooEslmMWFGIML/mI8LzHyPyek5/X5IYsINuma9kjZL3dww3lN
         f8qgqESVAGiPCpLCS9+0POnUFSk4GvsOCM8sIBLCPlcvPAuZMjT7Rtq+IPlv3PimfKbt
         iVz5c67Z4n5WCxXUwwZUbjm02zxLNrl2wr/lmUEor7suLk7yVOpLZKx6IVX6vcNcd2Q3
         1bepEk/k5XRpxkHFYcyZeIvTAeLdHPeL0knMLwc05UUNacNPaAKOgWqoRCG3rmUSWR+b
         L+aCA40NGbPCYqIspEzD5yPOGTVfQrGnbI+BVGsQz1OmDR6FxEqcwzB/IWZSD6i8Y281
         egxQ==
X-Gm-Message-State: AC+VfDwy5qZr6j3/TUraPBa8oEKGEG3w0lijvDAGypxGpdIzOnpqfBzk
	bByFqX6qbQkMbp/sjAH7ePeiEQ==
X-Google-Smtp-Source: ACHHUZ4lpjXjmkmvEJ7+K6VgK2zU9ROdY2N4oWlN6oIFVB3ihHYUvHLy/UW9KTFd/fdmKnI/faz0Jg==
X-Received: by 2002:a05:6a00:1989:b0:668:8b43:8ded with SMTP id d9-20020a056a00198900b006688b438dedmr15678103pfl.26.1687540680069;
        Fri, 23 Jun 2023 10:18:00 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:bcd2:2fb7:43de:322f])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7818b000000b0064fd4a6b306sm6320547pfi.76.2023.06.23.10.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 10:17:59 -0700 (PDT)
Date: Fri, 23 Jun 2023 10:17:54 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, bjorn@kernel.org,
	Conor Dooley <conor@kernel.org>, jszhang@kernel.org,
	llvm@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
Message-ID: <ZJXTwqZIkXLxXaSi@google.com>
References: <20230622215327.GA1135447@dev-arch.thelio-3990X>
 <mhng-6c34765c-126d-4e6c-8904-e002d49a4336@palmer-ri-x1c9a>
 <20230622231803.GA1790165@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Ntym+K/CqqiHps72"
Content-Disposition: inline
In-Reply-To: <20230622231803.GA1790165@dev-arch.thelio-3990X>


--Ntym+K/CqqiHps72
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 22, 2023 at 11:18:03PM +0000, Nathan Chancellor wrote:
> If you wanted to restrict it to just LD_IS_BFD in arch/riscv/Kconfig,
> that would be fine with me too.
> 
>   select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if LD_IS_BFD

Hi Jisheng, would you mind sending a v3 with the attached patch applied
on top / at the end of your series?

> 
> Nick said he would work on a report for the LLVM side, so as long as
> this issue is handled in some way to avoid regressing LLD builds until
> it is resolved, I don't think there is anything else for the kernel to
> do. We like to have breadcrumbs via issue links, not sure if the report
> will be internal to Google or on LLVM's issue tracker though;
> regardless, we will have to touch this block to add a version check
> later, at which point we can add a link to the fix in LLD.

https://github.com/ClangBuiltLinux/linux/issues/1881

--Ntym+K/CqqiHps72
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-riscv-disable-DEAD_CODE_ELIMINATION-for-LLD.patch"

From 3e5e010958ee41b9fb408cfade8fb017c2fe7169 Mon Sep 17 00:00:00 2001
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 23 Jun 2023 10:06:17 -0700
Subject: [PATCH] riscv: disable HAVE_LD_DEAD_CODE_DATA_ELIMINATION for LLD

Linking allyesconfig with ld.lld-17 with CONFIG_DEAD_CODE_ELIMINATION=y
takes hours.  Assuming this is a performance regression that can be
fixed, tentatively disable this for now so that allyesconfig builds
don't start timing out.  If and when there's a fix to ld.lld, this can
be converted to a version check instead so that users of older but still
supported versions of ld.lld don't hurt themselves by enabling
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y.

Link: https://github.com/ClangBuiltLinux/linux/issues/1881
Reported-by: Palmer Dabbelt <palmer@dabbelt.com>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Hi Jisheng, would you mind sending a v3 with this patch on top/at the
end of your patch series?

 arch/riscv/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 8effe5bb7788..0573991e9b78 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -116,7 +116,8 @@ config RISCV
 	select HAVE_KPROBES if !XIP_KERNEL
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
-	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
+	# https://github.com/ClangBuiltLinux/linux/issues/1881
+	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
 	select HAVE_MOVE_PMD
 	select HAVE_MOVE_PUD
 	select HAVE_PCI
-- 
2.41.0.162.gfafddb0af9-goog


--Ntym+K/CqqiHps72--
