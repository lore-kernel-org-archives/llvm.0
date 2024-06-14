Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEED214884B
	for <llvm@lists.linux.dev>; Fri, 14 Jun 2024 13:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718370742; cv=none; b=iUTip6WUFDvR65TIb9WLz9cNwNSss9vH5F3QVf2loa2vGw1meWj2o262z+YkGSc9SkQE29q7eI4lRbTzfM/mBUcHdXGux/jg0aR+Ld7IvL2SSFe71mdovUKKXl1aGDNVijvWobTUG5BWGH/RoMxTI4au8iPKRB52siMimzE7l7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718370742; c=relaxed/simple;
	bh=5pyCjKvHyuTZxO/AHCR2mbzqSFMYEjXIZrJUEfJpm8o=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=OCQCFK8lO68naFtZAeKpS/ekRYG6nIDF87rsThZ0uTp3j8WhOf3m1R78/0T/yO8q6sBnSS7jHr4iI5qa4auJyHcFtbH4aOd5UIlcAvh7vntqVxw+AjQSpH/FRvG6h50FUlAj3v7NnAz1R9X0Et/ZNtTszN7IhBzMh6g2PMTZRlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eEnoFpCx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eEnoFpCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718370739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JmLEPMxTG4Gsk5yP2q+OTPDt9lbS7dRpXq+3ymJSfok=;
	b=eEnoFpCxl1uRDfWiQZUEedNPVABOG9SdlKd+8mkEHBqwqwUrOIi80hSp3QDOjMx/JY8ylz
	Lrzu+P2VZX93ngiWK5SihX97miebjIWLXG9FBAK8hyuxxWiqpgEi6dTOCxwZskXZ5umVPL
	klDv5pivcDPs4c0rWDGHliO1vIXnIQM=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-128-sz_GT0PePVyMwErmd2WXkA-1; Fri,
 14 Jun 2024 09:12:17 -0400
X-MC-Unique: sz_GT0PePVyMwErmd2WXkA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1811A19560AE
	for <llvm@lists.linux.dev>; Fri, 14 Jun 2024 13:12:17 +0000 (UTC)
Received: from [172.64.3.44] (unknown [10.30.33.101])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7082619560BF;
	Fri, 14 Jun 2024 13:12:16 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 24 of 192): Test report for master
 (6.10.0-rc3, mainline.kernel.org-clang, d20f6b3d)
Date: Fri, 14 Jun 2024 13:12:16 -0000
To: bgoncalv@redhat.com, llvm@lists.linux.dev, omosnace@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <87215.124061409121702699@us-mta-128.us.mimecast.lan>
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
    Commit message: Merge tag 'net-6.10-rc4' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1331624889

One or more kernel tests failed:
    Unrecognized or new issues:
        Libkcapi AF_ALG test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1331624889-x86_64-kernel_upt_22
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1331624889-x86_64-kernel_upt_35
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
        Issue: Storage nvme - rdma: nvme/014 - flush: Interrupted system ca=
ll
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1980181
            Affected tests:
                Storage - blktests - nvme-tcp - upstream [x86_64]
        Issue: [rhel-10] xfstests - cifsv3.11 - generic/207 - error in bloc=
k: expected 4096 bytes, received 0
            URL: https://issues.redhat.com/browse/RHEL-39974
            Affected tests:
                xfstests - cifsv3.11 [x86_64, x86_64 (debug)]


Tests that were not ran because of internal issues:=20
    AMTU (Abstract Machine Test Utility) [x86_64 (debug)]
    Boot test [s390x]
    CKI/restraint [s390x]
    Filesystem - Loopdev Sanity [x86_64 (debug)]
    Hardware - pciutils: sanity smoke test [x86_64 (debug)]
    kselftests upstream - bpf [x86_64 (debug)]
    kselftests upstream - bpf_test_progs [x86_64 (debug)]
    kselftests upstream - net [x86_64 (debug)]
    Libkcapi AF_ALG test [x86_64 (debug)]
    machineinfo [s390x]
    Memory function: memfd_create [x86_64 (debug)]
    Networking - Ethernet drivers sanity [x86_64 (debug)]
    Networking cki netfilter test [x86_64 (debug)]
    POSIX pjd-fstest suites [x86_64 (debug)]
    Reboot test [s390x, x86_64 (debug)]
    SELinux Custom Module Setup [s390x, x86_64]
    Storage - blktests - blk - upstream [s390x]
    Storage - blktests - nvme-tcp - upstream [s390x]
    Storage - dm/common [x86_64 (debug)]
    Storage - swraid scsi_raid [s390x]
    stress: stress-ng - cpu-cache [s390x]
    stress: stress-ng - memory [s390x]


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

