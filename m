Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A9AD26A
	for <llvm@lists.linux.dev>; Sun, 17 Mar 2024 02:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710643881; cv=none; b=o2le7xlgWUd9zDIJzvjTYHPLykUSTsqPHKhm58kALDYmbllfUB24rPSIrlpojxBf/XfbGsu85bD1xioc2/ejhIHYlAYXuMqEWHA6szXQewLhLam970cdLLoK9VbP1JM4o8WYZjk9dg3oGLb9bcI0SR7Te2osyrhOp5YfME5x2xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710643881; c=relaxed/simple;
	bh=01dIJB+PJSFl8lvnjEJH1MKioXntPWlQpOPAFoJh9YM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Z2K66ajPDAl8xTSYen+QDmne0UTBI8sClee80LljfF1iroFp/REeqk/uIR+tEuWx4Y1xRXjGUMPEgJsqlx2pxhS4wNERkXjDNsCi5hc71b17/GEM+H/8n0gIiO3Iapg/cWsl4noUaVuBtTllJgbzW6J8e/9NtM46BoyL429gGlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cq7ZghAR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cq7ZghAR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710643876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IjIjW172HeloFvLcMBPDy6sKKN3BMK4cbuvLFJgCbVM=;
	b=Cq7ZghAROecr7jnkflVpJwU/ht2fBQ5rJZYCuwlpcBsQAoYpfvgd7svlBlhncCKeWzfjui
	+pyroDwstiyBawqzxoXDK/qtw6IJVfk3jLY1gSx+mLdZ1mjdPhQY0NnycCj/LIUZD9oNdu
	bc34HpIkyRKjZRGl2xXnyrqFZsawGsQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-TbRNYPmaPxqyJFVFmBZ0hQ-1; Sat, 16 Mar 2024 22:51:12 -0400
X-MC-Unique: TbRNYPmaPxqyJFVFmBZ0hQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78865101A526;
	Sun, 17 Mar 2024 02:51:12 +0000 (UTC)
Received: from [172.64.11.40] (unknown [10.30.34.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1151B202451F;
	Sun, 17 Mar 2024 02:51:11 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 33 of 204): Test report for master
 (6.8.0, mainline.kernel.org-clang, c1f10ac8)
Date: Sun, 17 Mar 2024 02:51:11 -0000
To: shinichiro.kawasaki@wdc.com, yizhan@redhat.com, bhe@redhat.com,
 xzhou@redhat.com, yiyan@redhat.com, xiawu@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Message-Id: <79188.124031622511200186@us-mta-440.us.mimecast.lan>
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
    Commit message: Merge tag 'nfs-for-6.9-1' of git://git.linux-nfs.org/pr=
ojects/trondmy/linux-nfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/135366

One or more kernel tests failed:
    =E2=9D=97 Regression(s) detected:
         ppc64le - kdump - sysrq-c
                   Issue: [upstream] readpage_elf: Attempt to read non-exis=
tent page at 0x4000000000000000
                          https://gitlab.com/cki-project/kernel-ark/-/issue=
s/132
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11700383
         ppc64le - kdump - file-load
                   Issue: [upstream] readpage_elf: Attempt to read non-exis=
tent page at 0x4000000000000000
                          https://gitlab.com/cki-project/kernel-ark/-/issue=
s/132
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11700384

    Note: Any of these might not be a regression and/or we might have mista=
kenly thought this issue to be fixed.
          If it is not a regression, please ask the test maintainer to reop=
en the issue and untag the regression from this execution.

    Unrecognized or new issues:
         aarch64 - Storage - blktests - blk - upstream
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11700429
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic
           s390x - Storage - blktests - blk - upstream
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11700476
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic
          x86_64 - Storage - blktests - blk - upstream
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11700297
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic
          x86_64 (debug) - xfstests - xfs
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11700420
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/157
                       =E2=9D=8C FAIL generic/161
                       =E2=9D=8C FAIL generic/171
                       =E2=9D=8C FAIL generic/172
                       =E2=9D=8C FAIL generic/173
                       =E2=9D=8C FAIL generic/174
                       =E2=9D=8C FAIL generic/183
                       =E2=9D=8C FAIL generic/185
                       =E2=9D=8C FAIL generic/188
                       =E2=9D=8C FAIL generic/189
                       =E2=9D=8C FAIL generic/190
                       =E2=9D=8C FAIL generic/191
                       =E2=9D=8C FAIL generic/194
                       =E2=9D=8C FAIL generic/195
                       =E2=9D=8C FAIL generic/196
                       =E2=9D=8C FAIL generic/197
                       =E2=9D=8C FAIL generic/199
                       =E2=9D=8C FAIL generic/200
                       =E2=9D=8C FAIL generic/201
                       =E2=9D=8C FAIL generic/202
                       =E2=9D=8C FAIL generic/203
                       =E2=9D=8C FAIL generic/205
                       =E2=9D=8C FAIL generic/206
                       =E2=9D=8C FAIL generic/216
                       =E2=9D=8C FAIL generic/217
                       =E2=9D=8C FAIL generic/220
                       =E2=9D=8C FAIL generic/222
                       =E2=9D=8C FAIL generic/227
                       =E2=9D=8C FAIL generic/238
                       =E2=9D=8C FAIL generic/253
                       =E2=9D=8C FAIL generic/259
                       =E2=9D=8C FAIL generic/261
                       =E2=9D=8C FAIL generic/262
                       =E2=9D=8C FAIL generic/264
                       =E2=9D=8C FAIL generic/287
                       =E2=9D=8C FAIL generic/289
                       =E2=9D=8C FAIL generic/290
                       =E2=9D=8C FAIL generic/291
                       =E2=9D=8C FAIL generic/292
                       =E2=9D=8C FAIL generic/293
                       =E2=9D=8C FAIL generic/295
                       =E2=9D=8C FAIL generic/296
                       =E2=9D=8C FAIL generic/301
                       =E2=9D=8C FAIL generic/302
                       =E2=9D=8C FAIL generic/305
                       =E2=9D=8C FAIL generic/326
                       =E2=9D=8C FAIL generic/327
                       =E2=9D=8C FAIL generic/328
                       =E2=9D=8C FAIL generic/330
                       =E2=9D=8C FAIL generic/332
                       =E2=9D=8C FAIL generic/353
                       =E2=9D=8C FAIL generic/358
                       =E2=9D=8C FAIL generic/359
                       =E2=9D=8C FAIL generic/372
                       =E2=9D=8C FAIL generic/414
                       =E2=9D=8C FAIL generic/493

    We also see the following known issues which are not related to your ch=
anges:
        Issue: kselftest build - bpf: bpf-helpers.rst:20: (WARNING/2) Field=
 list ends without a blank line; unexpected unindent
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1405
            Affected tests:
                  x86_64 (debug) - kselftest build - bpf
        Issue: xfstests generic/245: cannot overwrite File exists
            URL: https://www.spinics.net/lists/fstests/msg23667.html
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
        Issue: [rawhide] [s390x] avc:  denied  { read write } for  pid=3D12=
701 comm=3D"systemd-user-ru" name=3D"z90crypt" dev=3D"devtmpfs" ino=3D103 s=
context=3Dsystem_u:system_r:systemd_logind_t:s0 tcontext=3Dsystem_u:object_=
r:crypt_device_t:s0 tclass=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2263825
            Affected tests:
                   s390x - machineinfo
                   s390x - Boot test
                   s390x - POSIX pjd-fstest suites
                   s390x - Filesystem - Loopdev Sanity
                   s390x - AMTU (Abstract Machine Test Utility)
                   s390x - Networking cki netfilter test
                   s390x - Networking vnic: ipvlan/basic
                   s390x - Libkcapi AF_ALG test
                   s390x - Reboot test


Tests that were not ran because of internal issues:=20
     aarch64 - Storage - blktests - nvme-tcp - upstream
     aarch64 - Storage - swraid scsi_raid
     aarch64 - stress: stress-ng - cpu-cache
     aarch64 - stress: stress-ng - memory
     aarch64 - Reboot test
     aarch64 - Memory function: memfd_create
     ppc64le - Memory function: memfd_create
       s390x - Storage - blktests - nvme-tcp - upstream
       s390x - Storage - swraid scsi_raid
       s390x - stress: stress-ng - cpu-cache
       s390x - stress: stress-ng - memory
       s390x - Reboot test
       s390x - Memory function: memfd_create
      x86_64 - Storage - blktests - nvme-tcp - upstream
      x86_64 - Storage - swraid scsi_raid
      x86_64 - stress: stress-ng - cpu-cache
      x86_64 - stress: stress-ng - memory
      x86_64 - Reboot test
      x86_64 - Memory function: memfd_create
      x86_64 - Reboot test
      x86_64 (debug) - POSIX pjd-fstest suites
      x86_64 (debug) - Filesystem - Loopdev Sanity
      x86_64 (debug) - Memory function: memfd_create
      x86_64 (debug) - AMTU (Abstract Machine Test Utility)
      x86_64 (debug) - Networking - Ethernet drivers sanity
      x86_64 (debug) - Networking cki netfilter test
      x86_64 (debug) - Libkcapi AF_ALG test
      x86_64 (debug) - Hardware - pciutils: sanity smoke test
      x86_64 (debug) - Storage - dm/common
      x86_64 (debug) - kselftests upstream - net
      x86_64 (debug) - kselftests upstream - bpf
      x86_64 (debug) - kselftests upstream - bpf_test_progs
      x86_64 (debug) - Reboot test


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

