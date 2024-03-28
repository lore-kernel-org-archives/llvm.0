Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7491A1DFF2
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 13:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711631491; cv=none; b=URYzc5KYYj4Zreb2lrXdNDdX8a74CxXcS6imTdzSFBFk0PgB307xNpXz4HFk20dhB9hwbeV0yJ4Kyp6bYQBObKfWh3coumtRV5PJCPDDWrzTIaR14UMC5a168ZdKsDaOqvVEAT6/xgjiGsYp50XBdr/Lys8U2fkVNqiyeiwdsrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711631491; c=relaxed/simple;
	bh=+MFVxEoCzBEM5Lzi/kCSxgwAT1gm6s6084vqlAsjAks=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=KHu1q4RfehXQADc892z4T3rkgXPTvyiG0Cbb/ivRAglp7Tl5VywDTARgcYqGt39AfDIZpA/2+XXiODtnoa3ParX0qRu6pJE0mONBeXym9S0CM9to5+qpl02UOl6iB7hQgvyLaH/zIdLc3Lg++E34DPO7jXEK6UHkE8HOLqvTZqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fsrcpZLs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fsrcpZLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711631488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hl5zAyd41gjD3enBnJFyZJ9vd2Lof3GxRUUUOnCx4Lw=;
	b=fsrcpZLsL/IrF5cWh4wVQd5yBwaywdyIuwn17fzlfXSPKNy2nDR5bgRAiYVYmkV2pLQPB1
	mG3NXEIsOd9HOJg0ZSJIbXVeI3iLXZ6SYHK+2D0Um1IfNoQxo9KEcnu0wlVU060z4uxYIL
	kjhnVbfLdREFxvRaYcLdTGnv/oAkoMg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-7qvid-ZeOoeiQk93UVtvYw-1; Thu, 28 Mar 2024 09:11:27 -0400
X-MC-Unique: 7qvid-ZeOoeiQk93UVtvYw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65E6B816F23
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 13:11:11 +0000 (UTC)
Received: from [172.64.11.58] (unknown [10.30.34.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1EE60C53361;
	Thu, 28 Mar 2024 13:11:11 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 199 of 204): Test report for master
 (6.9.0-rc1, mainline.kernel.org-clang, 4076fa16)
Date: Thu, 28 Mar 2024 13:11:11 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Message-Id: <46479.124032809112700775@us-mta-74.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
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
    Commit message: Merge tag '9p-fixes-for-6.9-rc1' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/ericvh/v9fs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/137841

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: kselftest build - bpf: bpf-helpers.rst:20: (WARNING/2) Field=
 list ends without a blank line; unexpected unindent
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1405
            Affected tests:
                kselftest build - bpf [x86_64 (debug)]


Tests that were not ran because of internal issues:=20
    AMTU (Abstract Machine Test Utility) [x86_64, aarch64, ppc64le, x86_64 =
(debug), s390x]
    Boot test [x86_64, x86_64, x86_64, x86_64, x86_64, aarch64, aarch64, aa=
rch64, aarch64, aarch64, ppc64le, ppc64le, ppc64le, x86_64 (debug), x86_64 =
(debug), x86_64 (debug), s390x, s390x, s390x, s390x]
    CKI/restraint [x86_64, x86_64, x86_64, x86_64, x86_64, aarch64, aarch64=
, aarch64, aarch64, aarch64, ppc64le, ppc64le, ppc64le, x86_64 (debug), x86=
_64 (debug), x86_64 (debug), s390x, s390x, s390x, s390x]
    Filesystem - Loopdev Sanity [x86_64, aarch64, ppc64le, x86_64 (debug), =
s390x]
    Hardware - Firmware test suite [aarch64]
    Hardware - pciutils: sanity smoke test [x86_64, x86_64 (debug)]
    kdump - file-load [x86_64, ppc64le, s390x]
    kdump - kexec-file-load [x86_64, aarch64, s390x]
    kdump - kexec_boot [x86_64, aarch64, s390x]
    kdump - sysrq-c [x86_64, aarch64, ppc64le, s390x]
    kselftests upstream - bpf [x86_64, x86_64 (debug)]
    kselftests upstream - bpf_test_progs [x86_64, x86_64 (debug)]
    kselftests upstream - net [x86_64, x86_64 (debug)]
    Libkcapi AF_ALG test [x86_64, aarch64, ppc64le, x86_64 (debug), s390x]
    machineinfo [x86_64, x86_64, x86_64, x86_64, x86_64, aarch64, aarch64, =
aarch64, aarch64, aarch64, ppc64le, ppc64le, ppc64le, x86_64 (debug), x86_6=
4 (debug), x86_64 (debug), s390x, s390x, s390x, s390x]
    Memory function: memfd_create [x86_64, aarch64, ppc64le, x86_64 (debug)=
, s390x]
    Networking - Ethernet drivers sanity [x86_64, aarch64, ppc64le, x86_64 =
(debug), s390x]
    Networking cki netfilter test [x86_64, aarch64, ppc64le, x86_64 (debug)=
, s390x]
    Networking vnic: ipvlan/basic [x86_64, aarch64, ppc64le, s390x]
    POSIX pjd-fstest suites [x86_64, aarch64, ppc64le, x86_64 (debug), s390=
x]
    Reboot test [x86_64, x86_64, x86_64, x86_64, x86_64, aarch64, aarch64, =
aarch64, aarch64, aarch64, ppc64le, ppc64le, ppc64le, x86_64 (debug), x86_6=
4 (debug), x86_64 (debug), s390x, s390x, s390x, s390x]
    SELinux Custom Module Setup [x86_64, x86_64, x86_64, x86_64, x86_64, aa=
rch64, aarch64, aarch64, aarch64, aarch64, ppc64le, ppc64le, ppc64le, x86_6=
4 (debug), x86_64 (debug), x86_64 (debug), s390x, s390x, s390x, s390x]
    selinux-policy: serge-testsuite [x86_64, aarch64, ppc64le, s390x]
    Storage - blktests - blk - upstream [x86_64, aarch64, s390x]
    Storage - blktests - nvme-tcp - upstream [x86_64, aarch64, s390x]
    Storage - dm/common [x86_64, aarch64, ppc64le, x86_64 (debug), s390x]
    Storage - swraid scsi_raid [x86_64, aarch64, x86_64 (debug), s390x]
    stress: stress-ng - cpu-cache [x86_64, aarch64, s390x]
    stress: stress-ng - memory [x86_64, aarch64, s390x]
    xfstests - btrfs [x86_64, aarch64, x86_64 (debug)]
    xfstests - cifsv3.11 [x86_64, x86_64 (debug)]
    xfstests - ext4 [x86_64, aarch64, x86_64 (debug)]
    xfstests - nfsv4.2 [x86_64, x86_64 (debug)]
    xfstests - xfs [x86_64, aarch64, x86_64 (debug)]


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

