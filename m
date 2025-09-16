Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA97BA4A
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050348; cv=none; b=KRcoXA+wOiFq4nrdirEaBtCBYhFBXFfFWlmcVGUzhPCnR2ZmyUyV+LqWnhKF8fkGU7mSAugKZnrBuq5RT89UFBFP++FuZSDZhVx2SUU6x1Dcum2F9k4uNJQjoyVRO3Ykdx8RmwRnTV6kZcMpGSzBO9CKKcCJ5Qvb+CUQWxDUoY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050348; c=relaxed/simple;
	bh=oeklitj+rzS7z3FHaud7cY8XwnRKQbpCYrC6w6jOCKQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Qahuwka8co6yvPex6HgykpXC2nfr2/s96GWUhMNWyAbR2wwfCrG2MBhk+9yqMYTh06t6t3Bgp6uNK0A+Y/GlTccY5taO4jlxvFmCXFzHjoJj1cq25SDIhB1ROJYK7KTGdZtOpl0pGfLupB4pfTfTC9ht/1uMSyFCBKAHELyscng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AEdg1W0A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AEdg1W0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=S8oDHwy8MJRyooUDjZ46+AjbS8pK9aF2mK/d1KlVluE=;
	b=AEdg1W0A7LDQ6VXMFBLbpr8BMZJ4+X/TyBXB4v3Wz+IJxk9o571VL28aifwtoKaphSF2+j
	3G30iqCTjftcXxyAMJf2ttkCMpn+FDPHD0cxn29N2ulTJVobddcxmjwmDY+6LGV9WRk6hJ
	L9wQHUueDE+Hd9DkXcrvBeh2RVb71+E=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-344-Ve5PCpMnPoWqW2iAnIO2Tw-1; Tue,
 16 Sep 2025 15:19:05 -0400
X-MC-Unique: Ve5PCpMnPoWqW2iAnIO2Tw-1
X-Mimecast-MFC-AGG-ID: Ve5PCpMnPoWqW2iAnIO2Tw_1758050344
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5318C1955DB8
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:19:04 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EFFA51800452;
	Tue, 16 Sep 2025 19:19:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 89 of 137): Test report for master
 (6.16.0-0, upstream-mainline, 3c4a063b)
Date: Tue, 16 Sep 2025 19:19:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <37522.125091615190502877@us-mta-344.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QX5Yfeaopx88XoRXv_epFnTSSs6e9uD9ObPXgd9Kezw_1758050344
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'trace-v6.17-2' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/trace/linux-trace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1963635195

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]


Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, ppc64le, s390x, x86_64]
    /distribution/command [aarch64, ppc64le, s390x, x86_64]
    /test/misc/machineinfo [aarch64, ppc64le, s390x, x86_64]
    Boot test [aarch64, ppc64le, s390x, x86_64]
    CKI/restraint [aarch64, ppc64le, s390x, x86_64]
    Reboot test [aarch64, ppc64le, s390x, x86_64]
    SELinux Custom Module Setup [aarch64, ppc64le, s390x, x86_64]
    selinux-policy: serge-testsuite [aarch64, ppc64le, s390x, x86_64]
    Storage - blktests - throtl [aarch64, s390x]
    Storage - blktests - ublk [aarch64, s390x]
    stress: stress-ng - cpu-cache [aarch64, s390x]
    stress: stress-ng - memory [aarch64, s390x]
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

