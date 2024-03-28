Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807361DFF2
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 13:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711631486; cv=none; b=enwlisIi0Xhbu4M4ZH8jbLj3MulFTPrrKiQq8V1DIi2O26Hyu9k4VQNSu2qT4k3TgA1OHHoBzqJvwDHwSogVg6W3lEqBk5FKde23rkPZsTqJ3KOI0ELNjC3ZSfzZvmAqhUammqBWLgNLAd22DgmPOP9d1Ig9CLDHuMmxY+ocx8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711631486; c=relaxed/simple;
	bh=HUByaQuWRaIKmZ26KXeRj8SPZkk7Pft/Zgj05UFaJDA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=hCcbT2rkhOqTRH3LZxovccmUCEUwiSbt6qsm7nffhlWch2UIxecxqRL+U6q5mtMVL/RMeqNYBUQNGBp/3B93rvDXkLXOMju3yIcHFNdexlqmLGyOCsrTOXSD8zzrx53n4uGXUN94rd15as87pEyZJR7UhedsA4qvWPQyVmqILiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iToduXIb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iToduXIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711631483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=THIe8Ou7tHgJUlWLoGF/4515OEDzwT3QE759NKBDK5Q=;
	b=iToduXIbcW/Ckn8OTBK9WA2TYdrJ21Ko8c+Uww+AfAK/H6TRWOvCPhUXPxIW7ET4qqAKY4
	E7JtasTBxVS0l/nAtmHsSOklfUAiaAmQhu9t0HQ9Ia7aVsr0+DGDYEqUs2HDVcZ5uVRWEJ
	mhmI58jD86/pPamXN2v3Jb8fsnqkr6E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-1QASwqn-NKGW8fcNX1qScQ-1; Thu, 28 Mar 2024 09:11:22 -0400
X-MC-Unique: 1QASwqn-NKGW8fcNX1qScQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2D2F816F22
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 13:11:21 +0000 (UTC)
Received: from [172.64.11.58] (unknown [10.30.34.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 681D93C54;
	Thu, 28 Mar 2024 13:11:21 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 199 of 204): Test report for master
 (6.9.0-rc1, mainline.kernel.org-clang, 96249052)
Date: Thu, 28 Mar 2024 13:11:21 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Message-Id: <85944.124032809112200258@us-mta-681.us.mimecast.lan>
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
    Commit message: Merge tag 'probes-fixes-v6.9-rc1' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/trace/linux-trace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/137724

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
    AMTU (Abstract Machine Test Utility) [x86_64 (debug), s390x, ppc64le, a=
arch64, x86_64]
    Boot test [x86_64 (debug), x86_64 (debug), x86_64 (debug), s390x, s390x=
, s390x, s390x, ppc64le, ppc64le, ppc64le, aarch64, aarch64, aarch64, aarch=
64, aarch64, x86_64, x86_64, x86_64, x86_64, x86_64]
    CKI/restraint [x86_64 (debug), x86_64 (debug), x86_64 (debug), s390x, s=
390x, s390x, s390x, ppc64le, ppc64le, ppc64le, aarch64, aarch64, aarch64, a=
arch64, aarch64, x86_64, x86_64, x86_64, x86_64, x86_64]
    Filesystem - Loopdev Sanity [x86_64 (debug), s390x, ppc64le, aarch64, x=
86_64]
    Hardware - Firmware test suite [aarch64]
    Hardware - pciutils: sanity smoke test [x86_64 (debug), x86_64]
    kdump - file-load [s390x, ppc64le, x86_64]
    kdump - kexec-file-load [s390x, aarch64, x86_64]
    kdump - kexec_boot [s390x, aarch64, x86_64]
    kdump - sysrq-c [s390x, ppc64le, aarch64, x86_64]
    kselftests upstream - bpf [x86_64 (debug), x86_64]
    kselftests upstream - bpf_test_progs [x86_64 (debug), x86_64]
    kselftests upstream - net [x86_64 (debug), x86_64]
    Libkcapi AF_ALG test [x86_64 (debug), s390x, ppc64le, aarch64, x86_64]
    machineinfo [x86_64 (debug), x86_64 (debug), x86_64 (debug), s390x, s39=
0x, s390x, s390x, ppc64le, ppc64le, ppc64le, aarch64, aarch64, aarch64, aar=
ch64, aarch64, x86_64, x86_64, x86_64, x86_64, x86_64]
    Memory function: memfd_create [x86_64 (debug), s390x, ppc64le, aarch64,=
 x86_64]
    Networking - Ethernet drivers sanity [x86_64 (debug), s390x, ppc64le, a=
arch64, x86_64]
    Networking cki netfilter test [x86_64 (debug), s390x, ppc64le, aarch64,=
 x86_64]
    Networking vnic: ipvlan/basic [s390x, ppc64le, aarch64, x86_64]
    POSIX pjd-fstest suites [x86_64 (debug), s390x, ppc64le, aarch64, x86_6=
4]
    Reboot test [x86_64 (debug), x86_64 (debug), x86_64 (debug), s390x, s39=
0x, s390x, s390x, ppc64le, ppc64le, ppc64le, aarch64, aarch64, aarch64, aar=
ch64, aarch64, x86_64, x86_64, x86_64, x86_64, x86_64]
    SELinux Custom Module Setup [x86_64 (debug), x86_64 (debug), x86_64 (de=
bug), s390x, s390x, s390x, s390x, ppc64le, ppc64le, ppc64le, aarch64, aarch=
64, aarch64, aarch64, aarch64, x86_64, x86_64, x86_64, x86_64, x86_64]
    selinux-policy: serge-testsuite [s390x, ppc64le, aarch64, x86_64]
    Storage - blktests - blk - upstream [s390x, aarch64, x86_64]
    Storage - blktests - nvme-tcp - upstream [s390x, aarch64, x86_64]
    Storage - dm/common [x86_64 (debug), s390x, ppc64le, aarch64, x86_64]
    Storage - swraid scsi_raid [x86_64 (debug), s390x, aarch64, x86_64]
    stress: stress-ng - cpu-cache [s390x, aarch64, x86_64]
    stress: stress-ng - memory [s390x, aarch64, x86_64]
    xfstests - btrfs [x86_64 (debug), aarch64, x86_64]
    xfstests - cifsv3.11 [x86_64 (debug), x86_64]
    xfstests - ext4 [x86_64 (debug), aarch64, x86_64]
    xfstests - nfsv4.2 [x86_64 (debug), x86_64]
    xfstests - xfs [x86_64 (debug), aarch64, x86_64]


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

