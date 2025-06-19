Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C8E3085D3
	for <llvm@lists.linux.dev>; Thu, 19 Jun 2025 07:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750316538; cv=none; b=VphBMC7uhTiTifHR3ElDNtCgILnYHeF06fCnJQUZT0Vnc6gyHmndv2l2x7MquOxmTsJDYrSq7MDDdGXzl1VQU3b5HX8pymBv3Kbbt9HruCx9g63LRJyjgoTpEvGBtzcAazGoRIaMh18+qeoEf7NVFvGmedloAqRVWpQF0hQPiuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750316538; c=relaxed/simple;
	bh=tYJOegZ5mcvE+WDXUNzdGrCg2MchawlXHnHVDAxAVkQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Ruvb8qwQe+3jxvh5ghxsvvdJ5HW3tIiyxFQZjWAlhtZp5U0tZ7TDg7+fozM/kgX18zs2J46A9FX/KX5/AXhzanlXNNBDX0VDtid3c8sEyc4+jNc80hGiEGAx/9UT2nYo3HOhibilUqOtaIo5dSXTwvmYAQqrmMFSwAG5aqyNvhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YN8YZFP2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YN8YZFP2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750316532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TAaQK7bNwdzX63vcF8DvU/8jmk8yUkIYVm+sE68D5Ek=;
	b=YN8YZFP2TdqaSXDhWmzICuJaWq1+g+BCkpKSQicYL0mTpSURVHTLwyL4OEubt2Ly68TN7T
	YW35Tv2/BYSTdSXurKGY5KHflm+EloIFVGepDQixWawqD0tJAVW0R/Z/0F6p3y4Gi1EroB
	8mLa6+1/LegMd6ZwIE3T0mavxB64/H4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-27-s241JpIzOBOKpIstyh0bhw-1; Thu,
 19 Jun 2025 03:02:07 -0400
X-MC-Unique: s241JpIzOBOKpIstyh0bhw-1
X-Mimecast-MFC-AGG-ID: s241JpIzOBOKpIstyh0bhw_1750316527
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 18F411809C81
	for <llvm@lists.linux.dev>; Thu, 19 Jun 2025 07:02:07 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 29C6A195608F;
	Thu, 19 Jun 2025 07:02:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 8 of 100): Test report for master
 (6.16.0-rc2, upstream-mainline, fb4d33ab)
Date: Thu, 19 Jun 2025 07:02:06 -0000
To: bgoncalv@redhat.com, ftjahjad@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <69323.125061903020800209@us-mta-27.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jbfPtyqGsbD6wWvMWH2q7MwVICuv323z1aWluLttL7U_1750316527
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag '6.16-rc2-ksmbd-server-fixes' of git://git.sa=
mba.org/ksmbd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1877682005

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1877682005-x86_64-kernel_upt_33
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic

    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: selinux-policy: serge-testsuite: FAIL: git clone https://src=
.fedoraproject.org/tests/selinux.git
            URL: https://datawarehouse.cki-project.org/kcidb/tests/7555723
            Affected tests:
                selinux-policy: serge-testsuite [aarch64]


Tests that were not ran because of internal issues:
    Reboot test [x86_64]
    SELinux Custom Module Setup [x86_64]
    xfstests - btrfs [x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [x86_64]


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

