Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4428E19FA8F
	for <llvm@lists.linux.dev>; Tue, 16 Jul 2024 19:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721158954; cv=none; b=OsRVHR23RO2NupsV1rC2/IVOrJZGcv/+nCB3qJi94CBYIYG3uo+U/csUctETf6WajUCI2Vw0iYVbHZHZa94mWcNWnypvGgGVhdmZMK1SWnk5H/7gRPYraVmvPgprtqViVkBC+eLPzf3wQMX9Gd7X87qf8MR9OJpN8qc5U6mqmVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721158954; c=relaxed/simple;
	bh=YxAMtpKZ0wt+/W96WVFhp62CsOjNquP/gGO93Cjr1lQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=USu/bBjtXczXVgHYFu+kjqawfNLCvPiqIsP1rSlgqV/1vb4GwE/ZDjE/OnGbKIuC1+5rPCFq2XpJlLdRWqEKirOFPmD3u0KOp9COZj5sTOmEGz22T4L/QiXxv9hpd5VOf5CahI/tSFip2pHT4YAg123QUHWY/GiJfJgE/jWRP+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EyLP++Wb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EyLP++Wb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721158950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Oab8FcZ8THmkgU2Jci5iYZ6jdfv36G0SNIkBUCdDU5I=;
	b=EyLP++Wb+eit0SV90/2vk9GjVryig5qhddUSr+Ornl7Eaef3/WkHyL7nQNiZrOUhn2M9ox
	oruCOP6JnozV4OMmA0AwHzejLbxC1aOPDEspFj5j0pEBjs+/RjKiPItUsNs2+KJvLIWTmL
	s5JQ6CTVw/txkn/ux0lkV8y85vTmdow=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-256-U-ezXquSPZKoDiu3AL9ytA-1; Tue,
 16 Jul 2024 15:42:28 -0400
X-MC-Unique: U-ezXquSPZKoDiu3AL9ytA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EEFA61955D56
	for <llvm@lists.linux.dev>; Tue, 16 Jul 2024 19:42:27 +0000 (UTC)
Received: from [172.64.10.23] (unknown [10.30.34.11])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9B48E19560B2;
	Tue, 16 Jul 2024 19:42:27 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 19 of 192): Test report for master
 (6.10.0, mainline.kernel.org-clang, e23dd95c)
Date: Tue, 16 Jul 2024 19:42:27 -0000
To: bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <35915.124071615422801439@us-mta-256.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'spi-v6.11' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/broonie/spi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1374901563

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1374901563-x86_64-kernel_upt_35
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:=20
    Boot test [s390x]
    CKI/restraint [s390x]
    machineinfo [s390x]
    Reboot test [aarch64, s390x]
    SELinux Custom Module Setup [ppc64le, s390x]
    Storage - blktests - blk - upstream [aarch64, s390x]
    Storage - blktests - nvme-tcp - upstream [aarch64, s390x]
    Storage - swraid scsi_raid [aarch64, s390x]
    stress: stress-ng - cpu-cache [aarch64, s390x]
    stress: stress-ng - memory [aarch64, s390x]


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

