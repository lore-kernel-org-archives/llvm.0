Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B25E524A
	for <llvm@lists.linux.dev>; Fri, 29 Mar 2024 04:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711686668; cv=none; b=TDgjWC/3CYOnjoOOmekZMqE56c2ry5RB0cxaq5CISBlWWnZQPhSpacRSf873vl+QuT3hwTej5WsQ+RRFdo/IyEAIguRQVasHT1k256QIYw6HGOlLkY9HDu5jlJGKkdQsuwzbuYqJaJjSlcmvyOjhTv5p19CIdQvaQ75xdV8maE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711686668; c=relaxed/simple;
	bh=4tuZU0VxAWZCngBO+KXLQ+svTKy/o+JCnKslmdnTO98=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=PFnC/YqpZKzpBtvjDVg595usz9B8TpXRqQGGYX9iVZ2jpk71vlUudiaAjhwoEEI0XcQspMCNfocppI72d9nsgv53nZhqRGitAXLv8DO4WrFaARf9Ip668W583qBLZQpWH0w572KV++SD5BP8OUdy3WA9rtChUu8sYhTZIKysPbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jM3QFB57; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jM3QFB57"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711686666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vPOKpqu+VonzKE60Go8Rzjj59IEMFfZ65ySNR1Kli2M=;
	b=jM3QFB57vzT6t7wDdj2HzXgTq9K7B3tTc5KBovMhAptuwH7SlLy963k19KEGSzHJqdJOfa
	OdnG3gFTsSBUG0IXdPsim8btkRCLVRDnF+WGyuKEs7hiC6GSsFkV6j63tu5dgi142UKJL3
	vBF8xp5RDRHds8uAD9alKRT75yca+Iw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-sG8DfgteMyGuBK47lJA5mQ-1; Fri, 29 Mar 2024 00:31:02 -0400
X-MC-Unique: sG8DfgteMyGuBK47lJA5mQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAB83800262
	for <llvm@lists.linux.dev>; Fri, 29 Mar 2024 04:31:02 +0000 (UTC)
Received: from [172.64.11.58] (unknown [10.30.34.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6577E111F3C6;
	Fri, 29 Mar 2024 04:31:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 199 of 204): Test report for master
 (6.9.0-rc1, mainline.kernel.org-clang, 317c7bc0)
Date: Fri, 29 Mar 2024 04:31:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Message-Id: <38229.124032900310201033@us-mta-43.us.mimecast.lan>
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
    Commit message: Merge tag 'mmc-v6.9-rc1' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/ulfh/mmc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/137979

Tests that were not ran because of internal issues:=20
    AMTU (Abstract Machine Test Utility) [s390x, ppc64le, aarch64, x86_64 (=
debug), x86_64]
    Boot test [s390x, s390x, s390x, s390x, ppc64le, ppc64le, ppc64le, aarch=
64, aarch64, aarch64, aarch64, aarch64, x86_64 (debug), x86_64 (debug), x86=
_64 (debug), x86_64, x86_64, x86_64, x86_64, x86_64]
    CKI/restraint [s390x, s390x, s390x, s390x, ppc64le, ppc64le, ppc64le, a=
arch64, aarch64, aarch64, aarch64, aarch64, x86_64 (debug), x86_64 (debug),=
 x86_64 (debug), x86_64, x86_64, x86_64, x86_64, x86_64]
    Filesystem - Loopdev Sanity [s390x, ppc64le, aarch64, x86_64 (debug), x=
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
    Libkcapi AF_ALG test [s390x, ppc64le, aarch64, x86_64 (debug), x86_64]
    machineinfo [s390x, s390x, s390x, s390x, ppc64le, ppc64le, ppc64le, aar=
ch64, aarch64, aarch64, aarch64, aarch64, x86_64 (debug), x86_64 (debug), x=
86_64 (debug), x86_64, x86_64, x86_64, x86_64, x86_64]
    Memory function: memfd_create [s390x, ppc64le, aarch64, x86_64 (debug),=
 x86_64]
    Networking - Ethernet drivers sanity [s390x, ppc64le, aarch64, x86_64 (=
debug), x86_64]
    Networking cki netfilter test [s390x, ppc64le, aarch64, x86_64 (debug),=
 x86_64]
    Networking vnic: ipvlan/basic [s390x, ppc64le, aarch64, x86_64]
    POSIX pjd-fstest suites [s390x, ppc64le, aarch64, x86_64 (debug), x86_6=
4]
    Reboot test [s390x, s390x, s390x, s390x, ppc64le, ppc64le, ppc64le, aar=
ch64, aarch64, aarch64, aarch64, aarch64, x86_64 (debug), x86_64 (debug), x=
86_64 (debug), x86_64, x86_64, x86_64, x86_64, x86_64]
    SELinux Custom Module Setup [s390x, s390x, s390x, s390x, ppc64le, ppc64=
le, ppc64le, aarch64, aarch64, aarch64, aarch64, aarch64, x86_64 (debug), x=
86_64 (debug), x86_64 (debug), x86_64, x86_64, x86_64, x86_64, x86_64]
    selinux-policy: serge-testsuite [s390x, ppc64le, aarch64, x86_64]
    Storage - blktests - blk - upstream [s390x, aarch64, x86_64]
    Storage - blktests - nvme-tcp - upstream [s390x, aarch64, x86_64]
    Storage - dm/common [s390x, ppc64le, aarch64, x86_64 (debug), x86_64]
    Storage - swraid scsi_raid [s390x, aarch64, x86_64 (debug), x86_64]
    stress: stress-ng - cpu-cache [s390x, aarch64, x86_64]
    stress: stress-ng - memory [s390x, aarch64, x86_64]
    xfstests - btrfs [aarch64, x86_64 (debug), x86_64]
    xfstests - cifsv3.11 [x86_64 (debug), x86_64]
    xfstests - ext4 [aarch64, x86_64 (debug), x86_64]
    xfstests - nfsv4.2 [x86_64 (debug), x86_64]
    xfstests - xfs [aarch64, x86_64 (debug), x86_64]


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

