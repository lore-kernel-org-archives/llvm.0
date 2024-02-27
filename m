Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545DDF4EB
	for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 06:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709014279; cv=none; b=L1iNeTvwU59eV9TOsqNF1dU/ODwUQ01d92qC5gOJ0gJk0LLKFdhPzmjWPK4TMud5XFJK6eXrQGMXU3n9Op4bTuo4G+ij2frpxbFzG2LD56zT7BL04lSO9kf8eOk7engCp6P1u4EXvz1EtXsDB/wq/XyYmCDH3owVlLbyMVIMck4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709014279; c=relaxed/simple;
	bh=Qirf7NKnFfOKGufQCj0o232bE9ZmTKS3atVcF6+xGik=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=DqUoY7xW06gfgwEoba82z2+OYVs8iCn5yLRQ3n4Vm3Db/6ChW4DvF318eGs49dmCWcOz8PE9fBS5U/Wh2Ncx64esyWKNvl/GPf4YIQKEcoGACIJeoIQpzqvAIVjkZaPBDyNPrD4iXyCDBEe3JokaxKUUJGVBGZZD+42YJRzGhzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GtcDpPFt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GtcDpPFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709014276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LvI2PjC8ozNKXMH5g6poNn7cBAc8+mQBDnE18RuIXkw=;
	b=GtcDpPFtUh9AOBUSwu4BWAbFSG7tR0ojywMnMsfZLLK3927PtEcF2KiwcI02sISAT4Ly3m
	z6M7QNBk3yapCAi8V1ZWrnJ7y1RNrrfo2PNHiXnZ4c10X9dOLOVCoPJHwXUsIvEgS21DyT
	W3W3wWdt+JsBWX6tNvIYr1zYIPq8xIk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-572-Srxws4eCMdu2OwdZlyOEnQ-1; Tue,
 27 Feb 2024 01:11:14 -0500
X-MC-Unique: Srxws4eCMdu2OwdZlyOEnQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE3572999B30
	for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 06:11:13 +0000 (UTC)
Received: from [172.64.13.36] (unknown [10.30.32.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F12BC10BBCE5;
	Tue, 27 Feb 2024 06:11:12 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 6 of 204): Test report for master
 (6.8.0-rc6, mainline.kernel.org-clang, 45ec2f5f)
Date: Tue, 27 Feb 2024 06:11:12 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Message-Id: <79076.124022701111400276@us-mta-572.us.mimecast.lan>
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
    Commit message: Merge tag 'mtd/fixes-for-6.8-rc7' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/mtd/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/131412

One or more kernel tests failed:
    =E2=9D=97 Regression(s) detected:
           s390x - Storage - blktests - blk - upstream
                   Issue: Storage blktests - nvme-tcp: nvme/012: TIMEOUT
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1188
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11466856
                   Issue: Storage blktests - nvme-tcp: nvme/012: TIMEOUT
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1188
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11466856
                   Issue: Storage blktests - nvme-tcp: nvme/012: TIMEOUT
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1188
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11466856
                   Issue: Storage blktests - nvme-tcp: nvme/012: TIMEOUT
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1188
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11466856
                   Issue: Storage blktests - nvme-tcp: nvme/012: TIMEOUT
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1188
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11466856
                   Issue: Storage blktests - nvme-tcp: nvme/012: TIMEOUT
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1188
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11466856
                   Issue: Storage blktests - nvme-tcp: nvme/012: TIMEOUT
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1188
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11466856
                   Issue: Storage blktests - nvme-tcp: nvme/012: TIMEOUT
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1188
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11466856

    Note: Any of these might not be a regression and/or we might have mista=
kenly thought this issue to be fixed.
          If it is not a regression, please ask the test maintainer to reop=
en the issue and untag the regression from this execution.

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] avc:  denied  { read write } for  pid=3D12364 comm=
=3D"plymouthd" name=3D"kmsg" dev=3D"devtmpfs" ino=3D10 scontext=3Dsystem_u:=
system_r:plymouthd_t:s0 tcontext=3Dsystem_u:object_r:kmsg_device_t:s0 tclas=
s=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2256442
            Affected tests:
                 aarch64 - Boot test
                 aarch64 - Reboot test
                 ppc64le - Boot test
                 ppc64le - Reboot test
                   s390x - Boot test
                   s390x - Storage - blktests - nvme-tcp - upstream
                   s390x - Reboot test
                  x86_64 - Boot test
                  x86_64 - Reboot test
                  x86_64 (debug) - Boot test
                  x86_64 (debug) - Reboot test
                  x86_64 (debug) - POSIX pjd-fstest suites
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: xfstests generic/245: cannot overwrite File exists
            URL: https://www.spinics.net/lists/fstests/msg23667.html
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
        Issue: xfstests: generic/354 file exists
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1654
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
        Issue: [upstream] blktests tests nbd/001 failed
            URL: https://github.com/osandov/blktests/issues/132
            Affected tests:
                 aarch64 - Storage - blktests - blk - upstream
                  x86_64 - Storage - blktests - blk - upstream
        Issue: [upstream] blktests tests/zbd/010 failed (WARNING: CPU: 22 P=
ID: 44011 at fs/iomap/iter.c:51)
            URL: https://lore.kernel.org/linux-block/CAHj4cs-kfojYC9i0G73PR=
kYzcxCTex=3D-vugRFeP40g_URGvnfQ@mail.gmail.com/T/#u
            Affected tests:
                 aarch64 - Storage - blktests - blk - upstream
                  x86_64 - Storage - blktests - blk - upstream
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                 aarch64 - stress: stress-ng - memory
                   s390x - stress: stress-ng - memory
                  x86_64 - stress: stress-ng - memory
        Issue: stress: stress-ng - memory: (panic) Comm: systemd-oomd Not t=
ainted 6.1.0-rc3
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1461
            Affected tests:
                 aarch64 - stress: stress-ng - memory
                  x86_64 - stress: stress-ng - memory
        Issue: [upstream] [aarch64] kdump - sysrq-c: (panic) dump_backtrace=
+0xe8/0x140
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1561
            Affected tests:
                 aarch64 - kdump - sysrq-c
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
        Issue: [rawhide] [s390x] avc:  denied  { read write } for  pid=3D12=
701 comm=3D"systemd-user-ru" name=3D"z90crypt" dev=3D"devtmpfs" ino=3D103 s=
context=3Dsystem_u:system_r:systemd_logind_t:s0 tcontext=3Dsystem_u:object_=
r:crypt_device_t:s0 tclass=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2263825
            Affected tests:
                   s390x - machineinfo
                   s390x - Boot test
                   s390x - Storage - blktests - nvme-tcp - upstream
                   s390x - Storage - swraid scsi_raid
                   s390x - stress: stress-ng - cpu-cache
                   s390x - stress: stress-ng - memory
                   s390x - Reboot test
                   s390x - POSIX pjd-fstest suites
                   s390x - AMTU (Abstract Machine Test Utility)
                   s390x - Networking cki netfilter test
                   s390x - Networking vnic: ipvlan/basic
                   s390x - Libkcapi AF_ALG test


Tests that were not ran because of internal issues:=20
     aarch64 - Memory function: memfd_create
     aarch64 - Reboot test
     ppc64le - Memory function: memfd_create
       s390x - Memory function: memfd_create
      x86_64 (debug) - Memory function: memfd_create
      x86_64 - Memory function: memfd_create


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

