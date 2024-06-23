Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA0179B9C
	for <llvm@lists.linux.dev>; Sun, 23 Jun 2024 18:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719166998; cv=none; b=bREPTrpOW+azbmaC5omaX1ZPK3sKZiTa/GSRB5L8HfRJeQHLAykfVp+MPylveGJE8v4W85IEWFqaZ8BkDymjzw7zeUypiQ0+pj2zrfJSd7Mq4FrpXyYzaG7oJ7SdKU3e/f5ejSRLcKSKyZphVQawRRgDZh903N/T5JB9ZDCK0lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719166998; c=relaxed/simple;
	bh=d9o8LWqfM9krm8yKAuzPtv9ZHEaeKi/H4Vp5FLhz1To=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=hXoVtJVgjrHTiNSpjkSGLaaRiV/nYdveIGlkcBPudPGCmJ8vq0rzUHSn7+UptQoHaz7AKMPTJkS83OMrMA99ARvxFD8RVz7803K07bYjK2ijhgy5QHfmRpJh4Q4fV1tjZJOLANPn8iuZakNM7cq/ki9M26FjzTYFHrb94XlEOSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=faKJoZ9G; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="faKJoZ9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719166995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bmQYybYMdYiNOi/aPSLaor/LFu1fKjyIKfJP4MkaBrg=;
	b=faKJoZ9GOQlZCkjLLs36OhwAW5YYeWwIisHYSdJJuIqKeWlf7gxCIplY5bNY/DVvQabiMx
	5CnTh/oNQ/QM9sav028+hWJE/t2AMylF4j6oH9EXLvvJX5cvXo7g9/IEWTD3I8IY4nCeVD
	GQx88wbFNS0X8qj/RjUlO/v7H+3k5ps=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-527-m-2y_dzSMXecjPXVb4pW3Q-1; Sun,
 23 Jun 2024 14:23:13 -0400
X-MC-Unique: m-2y_dzSMXecjPXVb4pW3Q-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7A0EB1956083
	for <llvm@lists.linux.dev>; Sun, 23 Jun 2024 18:23:12 +0000 (UTC)
Received: from [172.64.3.44] (unknown [10.30.33.101])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A20963000218;
	Sun, 23 Jun 2024 18:23:11 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 23 of 192): Test report for master
 (6.10.0-rc4, mainline.kernel.org-clang, d6c94157)
Date: Sun, 23 Jun 2024 18:23:11 -0000
To: xzhou@redhat.com, bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <67211.124062314231300338@us-mta-527.us.mimecast.lan>
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
    Commit message: Merge tag 'drm-fixes-2024-06-22' of https://gitlab.free=
desktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1342775689

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1342775689-x86_64-kernel_upt_35
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        xfstests - cifsv3.11
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1342775689-x86_64-kernel-debug_upt_32
        xfstests - nfsv4.2
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1342775689-x86_64-kernel-debug_upt_31

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream]blktests nbd/002 failure
            URL: https://github.com/osandov/blktests/issues/142
            Affected tests:
                Storage - blktests - blk - upstream [x86_64]
        Issue: [rhel-10] xfstests - cifsv3.11 - generic/207 - error in bloc=
k: expected 4096 bytes, received 0
            URL: https://issues.redhat.com/browse/RHEL-39974
            Affected tests:
                xfstests - cifsv3.11 [x86_64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


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
    SELinux Custom Module Setup [s390x]
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

