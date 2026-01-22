Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77669355802
	for <llvm@lists.linux.dev>; Thu, 22 Jan 2026 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769075076; cv=none; b=kTjSnu1jmV/4RCsq8ohCfxV8xAtWg0G6K0DiI/FTDFi063+5MlrgHgj7lRcr6Qee6akJgWqrNzKW41Q4akrnMVwrye5LH0iUZBOTJkleuJPQoR8eFy8VLWdGnQdaonzKK3G7yDhauGQfZaTTlE27+0pmgriCUwJje2OGm/CUsfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769075076; c=relaxed/simple;
	bh=paRhJoxipyTSFEVAwfW//2BXhX6IFGS2LPXZYyPgM04=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=u3IWCQEkfKU/urgArAn7gydt0KuaMkB67/L2uiU78+X95LXySOFTFe+F14gKpVdT4LNl6BlB0lm+NSYPt91rClmRVwqjV/7Eb9rFK8e9p+aTKOUveYb8yAoHcp27bx2lU9JPzAW3aq4EZsyTJveF1T6Dm1cKfRnJPgmEkL42hGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VM6/Fiqz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VM6/Fiqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769075073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0h4x+PvnJjxRJp0UuVyfe4v1EShGV4XQvf1gzMrJHoE=;
	b=VM6/FiqzR27rLMqZEMJHBuze0gKFMxmtdknRtq1zka5e6UhhYKkNaDgbuZda8eZf5+h++l
	wuEQ+NrX/HPwygGAHcCClRfR1D9zPOVaJuQ+Z2eWzbgr4WAyfMDwKzhibxIWgCmCnfYIP+
	Aqt9JByHEkWtmtkadbWgvcnhrUoLxXY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-2qTKp4e7MJiQUcuPOuM2DQ-1; Thu,
 22 Jan 2026 04:44:32 -0500
X-MC-Unique: 2qTKp4e7MJiQUcuPOuM2DQ-1
X-Mimecast-MFC-AGG-ID: 2qTKp4e7MJiQUcuPOuM2DQ_1769075071
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2583418002C3
	for <llvm@lists.linux.dev>; Thu, 22 Jan 2026 09:44:31 +0000 (UTC)
Received: from [172.20.12.215] (unknown [10.30.44.139])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A97D51800577;
	Thu, 22 Jan 2026 09:44:30 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 81 of 110): Test report for master
 (6.19.0-rc6, upstream-mainline, 6c790212)
Date: Thu, 22 Jan 2026 09:44:30 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <64719.126012204443200147@us-mta-588.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jVOqH1SGV_QA4oAEzQd6ZqjDnpVLiuPfT5ZdywkjYVY_1769075071
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'devicetree-fixes-for-6.19-3' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/robh/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2275054298

One or more kernel builds failed:
    Builds that are failing to boot:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2275054298_x86_64_kernel-debug

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, ppc64le, x86_64]
    /distribution/command [aarch64, ppc64le, x86_64]
    /test/misc/machineinfo [aarch64, ppc64le, x86_64]
    Boot test [aarch64, ppc64le, x86_64]
    CKI/restraint [aarch64, ppc64le, x86_64]
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    kselftests upstream - net [x86_64]
    Reboot test [aarch64, ppc64le, x86_64]
    SELinux Custom Module Setup [aarch64, ppc64le, x86_64]
    selinux-policy: serge-testsuite [aarch64, ppc64le, x86_64]
    Storage - blktests - throtl [aarch64, x86_64]
    Storage - blktests - ublk [aarch64, x86_64]
    stress: stress-ng - cpu-cache [aarch64, x86_64]
    stress: stress-ng - memory [aarch64, x86_64]
    xfstests - btrfs [aarch64, x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [aarch64, x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [aarch64, x86_64]


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

