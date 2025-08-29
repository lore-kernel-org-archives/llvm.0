Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A946020F08C
	for <llvm@lists.linux.dev>; Fri, 29 Aug 2025 18:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756492990; cv=none; b=lmgrwRlcmEqyPOB4pCmlGbRCzgFpJF97+713EBrbSAFLdROETngQB5OCAsb8iCorH8kHfnNPs031BwkaCKlZXl4/EbJAOh/vHR+1lK7pjpaH4ej1+Q2Moe9rxstoE/Offcat2KinxE93Cfs8+kW+FFauN9TzGF8CMrgJvopnvI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756492990; c=relaxed/simple;
	bh=Bbxo27sV6iAGgmmf2plACq/KLNjjy4v1O9wR5oq96oQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=GUFD1ReEN/RFPPwR5FR1y3ZX6/qeDzs49MAPcpArSdkUx98HzQXRNiU7HFdDDpT8E5oP7I8UVWYLPF0v0nr7XTaY8nT1VudqUogEnGDbiksA5Tpz7eaFCjfFcXMv9ciosaxEtJwKy50WWVVpIh4r/nSJ3KfpHPvVkxQ8AWXyapY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ayjrxFr3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ayjrxFr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756492987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZJY0V5I5D71TwSR4+q7uSs/c0ina/egxkFAWxp4/MdI=;
	b=ayjrxFr3+jxp2QeV3vvUQHJEdwhouQchwLD4dwRC9MwHdvkzmjNTGe1ekCeLS3i2tSdBWt
	HFbosAoo7pWbu/QHkvxarjLvsQnhDX/ir++L1LFxy2lttbgtUGMXH3V4eptx0jA6NBblNH
	6SBJo89Xl6VSq5ZyVGve6UdH7BhC67g=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-294-neB_TQaROPOnK35r6-DALw-1; Fri,
 29 Aug 2025 14:43:06 -0400
X-MC-Unique: neB_TQaROPOnK35r6-DALw-1
X-Mimecast-MFC-AGG-ID: neB_TQaROPOnK35r6-DALw_1756492985
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7C1DB1800286
	for <llvm@lists.linux.dev>; Fri, 29 Aug 2025 18:43:05 +0000 (UTC)
Received: from [172.20.143.215] (unknown [10.30.44.138])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0D5D419560BC;
	Fri, 29 Aug 2025 18:43:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (6.17.0-rc3,
 upstream-mainline, fb679c83)
Date: Fri, 29 Aug 2025 18:43:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <73460.125082914430600749@us-mta-294.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uOUHTuofc4ZLiB4Ecd0w2nAZkVptaPeDVFczI528k5g_1756492985
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'efi-fixes-for-v6.17-1' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/efi/efi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2012128496

One or more kernel builds failed:
    We also see the following known issues which are not related to your ch=
anges:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2012128496_aarch64_kernel
                   Issue: upstream build: No rule to make target 'kernel.sb=
at' -> Update CONFIG_EFI_SBAT_FILE
                          https://gitlab.com/cki-project/infrastructure/-/i=
ssues/897
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2012128496_x86_64_kernel
                   Issue: upstream build: No rule to make target 'kernel.sb=
at' -> Update CONFIG_EFI_SBAT_FILE
                          https://gitlab.com/cki-project/infrastructure/-/i=
ssues/897
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2012128496_x86_64_kernel-debug
                   Issue: upstream build: No rule to make target 'kernel.sb=
at' -> Update CONFIG_EFI_SBAT_FILE
                          https://gitlab.com/cki-project/infrastructure/-/i=
ssues/897


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

