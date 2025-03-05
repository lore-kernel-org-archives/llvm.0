Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F2C1DE3D1
	for <llvm@lists.linux.dev>; Wed,  5 Mar 2025 06:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741156832; cv=none; b=tqZoqy1jaBdXbYtKpVxVIDPZ+qpXM4DYUnneTbxtsE05DRsnU7+hFJYXfJACgC5ks/DwEyy4v2AWn7nwSxFUWCjWLVNCYV2yZ//Yq94VzaRLLzBj3gz12DG0OBQy2WG9YE1i3TcDlOIKpE9eQElbMhY2p/XIZHljuVIwQ3S3BkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741156832; c=relaxed/simple;
	bh=TKspK+PQiovK0ncvCYHqeBeVbg+BWGTQ/pxSsKpUs3c=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=GCtSbtvM95Bm93Uyt6EVIBA87fpNEzeCGVuuwTAomSaLwsmzU8RA4sarMaynHrpI4Aa5zKpVgMJFkdKGcD3YP+JKqOtBtBdkNyf26+RLNstko+ylRMWAxnIlFnU3srOSRdM3i9KqC16IxYXz9ZNTccagkGBbR3MMTbfD1ba8GbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kEIphjsh; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kEIphjsh"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e4c0c12bccso11273050a12.1
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 22:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741156829; x=1741761629; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8RYCbGQKPMxhvqsEXifn8NHTo+P5XfS0B8YmG0doTDQ=;
        b=kEIphjshesxgDnDuREIHVeMmyZXKsCRfn2WrnNwIhEYbFgIpt5poFBh0wFWp2WS7Kp
         CpChUxw117tugpR6687zkubuS6UNvfCkzP+4HYTQmk5GkMJ50MsYOgERyaplm/bFWhji
         JtgL8bJdy1t/JbYNhttScvHhM31GYAu4zPxEBkQd4XjXoulXsh7/xrQYkA93FgQxCh9v
         4bDaRaeyAVkVF54gFf9x9sF4skTvt1+Rcw8MrWDRZBH8T8dxXJsn9cmlNlPRjRK5AktU
         FNodwgjzPKXX1gVqmdxBN8RkXizDImUG/RmE2ZXGB3kWyfFevM/cw6rBlo+gKI/t1XaZ
         pP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741156829; x=1741761629;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8RYCbGQKPMxhvqsEXifn8NHTo+P5XfS0B8YmG0doTDQ=;
        b=bhqQcwdN761JiZW3WY5yZWauC78oxQ0HthPTEyZ0aSW1BJrjiXIF5ABgjixBw8ItOo
         xniqSe2n70p26li1HgTOfa1COksghoc7jIulJHRnXxnzfCmIIolJ0uDfpFPwlJoMFdRz
         FkRjN4MacH1nJIouXXAjFOVoeX0I/rLnv/G3iwADMmD5rtEccwREgQjM3rGEKo/FAfiK
         n2CfUpB8Vc1Ss/mFhnqZ+PgtBZq2UQ9haQfOT/UQC+t6MBFlVw6BHCbvkZeWQsmLyrgT
         WZsx+PV/SGk/1LowwLwtQDBUZD9rAaoTNsKCr4Otnf2MDCX+Ma9h8iUY9NgFJoALfVOy
         +0ZQ==
X-Gm-Message-State: AOJu0YxUHE+YFdP/Azbg905wSH3Cm/35cFs0wLRooOsKAlvOH9vKjoH7
	0VMrKDB8MqYqHOL39Ik/qS9eavjXaCL0EclAveH4nIlx9ysar0LdEJ4T/AeJVsNPE25FU2LGfTj
	h
X-Gm-Gg: ASbGnctrskLU5mGakLrbPfTke+zq9ulgqvygP+vKp8x5mqmUxDVcgzNrc6UBCmuhIhP
	8VLEEg4JxVPBOppPNRXcM5DuyBlCFu02af3UcXrFCtKsKxU4JOb6IzFyqNzZ2yy7gEDOsJwhE7c
	DxBjK4+JveLBaB4QXRdK3+hYeIptV/HsNpvwp6ELBk2SxNQk8n9xQlYaJndhBaP1qIDY1uWddMw
	QSjcW3mlFxPLM2YtIopOAn/omfZys5ylsIKClq9551osYb3q1F/pxI3iL+1YSrodoARXNhs3vq3
	NNo/IfcUhc4wQBLgRnKWnyN6em3eUGGV2UvT1vRrLQbyDpPAHMDr/0ER0x7iLRwFM4s9zkwyRck
	zEty5EzWXZ525+ALa
X-Google-Smtp-Source: AGHT+IFvW+c1N0lOrxZnS9cyoKWKJZLA0Bv7JkiQMEnPbkOkT6D2Nm8yvu12whlijkwdNh5IxFpMIg==
X-Received: by 2002:a05:6402:90d:b0:5e0:60ed:f355 with SMTP id 4fb4d7f45d1cf-5e59f3eb5b9mr1674771a12.18.1741156828664;
        Tue, 04 Mar 2025 22:40:28 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4cc6b2daasm8768165a12.25.2025.03.04.22.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 22:40:28 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Wed, 5 Mar 2025 06:40:26 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1491622737.157915.1741156828012@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.14-rc1-5-g568354b24c7dd: Failure on aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_157914_1715840493.1741156827118"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_157914_1715840493.1741156827118
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please fi=
nd some details below.

In tcwg_kernel/llvm-master-aarch64-next-allmodconfig, after:
  | commit v6.14-rc1-5-g568354b24c7dd
  | Author: Kai M=C3=A4kisara <Kai.Makisara@kolumbus.fi>
  | Date:   Thu Feb 13 11:26:34 2025 +0200
  |=20
  |     scsi: scsi_debug: Add compression mode page for tapes
  |    =20
  |     Add support for compression mode page. The compression status
  |     is saved and returned. No UA is generated.
  |    =20
  | ... 5 lines of the commit log omitted.

Produces Failure:
  | Results changed to
  | # reset_artifacts:
  | -10
  | # build_abe binutils:
  | -9
  | # build_kernel_llvm:
  | -5
  | # build_abe qemu:
  | -2
  | # linux_n_obj:
  | 26117
  |=20
  | From
  | # reset_artifacts:
  | -10
  | # build_abe binutils:
  | -9
  | # build_kernel_llvm:
  | -5
  | # build_abe qemu:
  | -2
  | # linux_n_obj:
  | 35986
  | # linux build successful:
  | all

Used configuration :
 tcwg_kernel/llvm-master-aarch64-next-allmodconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-159=
1. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolc=
hain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<=
--------------------------

The information below contains the details of the failures, and the ways to=
 reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch6=
4-next-allmodconfig-build/334/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch6=
4-next-allmodconfig-build/333/artifact/artifacts

Instruction to reproduce the build : https://git-us.linaro.org/toolchain/ci=
/interesting-commits.git/plain/linux/sha1/568354b24c7ddef335e7c39a3fa8c5467=
1187df5/tcwg_kernel/llvm-master-aarch64-next-allmodconfig/reproduction_inst=
ructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/commit=
/568354b24c7ddef335e7c39a3fa8c54671187df5
------=_Part_157914_1715840493.1741156827118--
