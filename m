Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5781946C
	for <llvm@lists.linux.dev>; Wed, 24 Jan 2024 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706091686; cv=none; b=ibXqnP2tcFZ07/q1JaFd1oO9FQ4z80oa2WTvPGVPo6xrjV42e0EaxW9aqDrb2Qlh5p9uC+WBFf3pJ+kpI9gotOFXPd4WQvzp7nqV+Q+1GkBjYweZX6mOEWAUbDokeAdhI1YI2XlhX5hg98gUAUaqUFZrXa7zxs8LbRxq+Tw7R+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706091686; c=relaxed/simple;
	bh=2dkPnxzOaCMt4CzMUTJ0PBTOyv+JHBIiMFRZl4NBjmQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=THBt7auyFjZ9UxBw6LqysAQ1elu3jHSYsY08UymJbzpyP1nVJgC+bHGT4WBoXpjC71uQf6VfXeOpawxJ304H9E+nDMoDJRGeDjJWmWhMNvnMzsJB8N0cwoPCFjzFe933buruyDFFZ1hFbNfpUKd1cBl6GpDk6VFttfnm6l3U+hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UUj06PfY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UUj06PfY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706091682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kE2IFbbTDPRO5j2r/IEmt8Szyhv8hc6psxomo/S7/i0=;
	b=UUj06PfYXkELhUztwpWD9/0vtk8LkJB0KVADVj7EW0w/3+oBl4eA1Vsc3Klm4CD4lbC+Dx
	aGNv3vnEvEdfsBkJsOOqsKE8RMPZIbm6NSU5KyzxFEtUQivvu/iMMZlRxT3lHFdqvnQjm1
	Sd3kvVP4POb4A4nGT7o2zJzg7m9b6J8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-XS04Rb63PRSV9o9ZEuRh5Q-1; Wed, 24 Jan 2024 05:21:21 -0500
X-MC-Unique: XS04Rb63PRSV9o9ZEuRh5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 014D685A597
	for <llvm@lists.linux.dev>; Wed, 24 Jan 2024 10:21:21 +0000 (UTC)
Received: from [172.64.0.99] (unknown [10.30.33.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E16472166B32;
	Wed, 24 Jan 2024 10:21:20 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 85 of 226): Test report for master
 (6.8.0-rc1, mainline.kernel.org-clang, e01a83e1)
Date: Wed, 24 Jan 2024 10:21:20 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Message-Id: <43104.124012405212100191@us-mta-322.us.mimecast.lan>
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
    Commit message: Revert "btrfs: zstd: fix and simplify the inline extent=
 decompression"

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/124885

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] avc:  denied  { read write } for  pid=3D12364 comm=
=3D"plymouthd" name=3D"kmsg" dev=3D"devtmpfs" ino=3D10 scontext=3Dsystem_u:=
system_r:plymouthd_t:s0 tcontext=3Dsystem_u:object_r:kmsg_device_t:s0 tclas=
s=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2256442
            Affected tests:
                 aarch64 - Boot test
                 aarch64 - stress: stress-ng - cpu-cache
                 aarch64 - Reboot test
                 ppc64le - Boot test
                 ppc64le - Reboot test
                   s390x - Boot test
                   s390x - stress: stress-ng - cpu-cache
                   s390x - Reboot test
                  x86_64 - Boot test
                  x86_64 - Reboot test
        Issue: [rawhide] avc:  denied  { checkpoint_restore } for  pid=3D79=
3 comm=3D"agetty" capability=3D40  scontext=3Dsystem_u:system_r:getty_t:s0-=
s0:c0.c1023 tcontext=3Dsystem_u:system_r:getty_t:s0-s0:c0.c1023 tclass=3Dca=
pability2 permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2259622
            Affected tests:
                 aarch64 - Boot test
                 aarch64 - stress: stress-ng - cpu-cache
                 aarch64 - Reboot test
                 ppc64le - Boot test
                 ppc64le - Reboot test
                   s390x - Boot test
                   s390x - stress: stress-ng - cpu-cache
                   s390x - Reboot test
                  x86_64 - Boot test
                  x86_64 - Reboot test
        Issue: [aarch64][coresight_etm4x][kernel 5.19.0] coresight-etm4x: p=
robe of ARMHC500:20 failed with error -17
            URL: https://lore.kernel.org/all/CA+QYu4ogiTa1V20aqxFqBrMH0z927=
YNNN2O=3DCKma+=3DM_8E81iQ@mail.gmail.com/
            Affected tests:
                 aarch64 - Boot test
                 aarch64 - Reboot test
        Issue: blktests nvme/ failure due to latest nvme-cli update
            URL: https://github.com/osandov/blktests/pull/131
            Affected tests:
                 aarch64 - Storage - blktests - blk
                 aarch64 - Storage - blktests - nvme-tcp
                   s390x - Storage - blktests - blk
                   s390x - Storage - blktests - nvme-tcp
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: nvme authentication setup failed observed during blktests nv=
me/041 nvme/042 nvme/043 nvme/044 nvme/045
            URL: https://lore.kernel.org/linux-nvme/CAHj4cs8vqrePA-TE_GGNAZ=
LG3iqZBq9L1GkanA4A0wRF_TXDeA@mail.gmail.com/
            Affected tests:
                 aarch64 - Storage - blktests - blk
                 aarch64 - Storage - blktests - nvme-tcp
                   s390x - Storage - blktests - blk
                   s390x - Storage - blktests - nvme-tcp
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                   s390x - stress: stress-ng - memory
                  x86_64 - stress: stress-ng - memory
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite


Tests that were not ran because of internal issues:=20
     aarch64 - Memory function: memfd_create
     ppc64le - Memory function: memfd_create
       s390x - Memory function: memfd_create
      x86_64 (debug) - CKI/restraint
      x86_64 (debug) - SELinux Custom Module Setup
      x86_64 (debug) - machineinfo
      x86_64 (debug) - Boot test
      x86_64 (debug) - Hardware - CPU: Die Test
      x86_64 (debug) - Storage - swraid scsi_raid
      x86_64 (debug) - Reboot test
      x86_64 (debug) - CKI/restraint
      x86_64 (debug) - SELinux Custom Module Setup
      x86_64 (debug) - machineinfo
      x86_64 (debug) - Boot test
      x86_64 (debug) - POSIX pjd-fstest suites
      x86_64 (debug) - Filesystem - Loopdev Sanity
      x86_64 (debug) - Memory function: memfd_create
      x86_64 (debug) - AMTU (Abstract Machine Test Utility)
      x86_64 (debug) - Networking - Ethernet drivers sanity
      x86_64 (debug) - Networking cki netfilter test
      x86_64 (debug) - Libkcapi AF_ALG test
      x86_64 (debug) - Hardware - pciutils: sanity smoke test
      x86_64 (debug) - Storage - dm/common
      x86_64 (debug) - Storage - lvm thinp sanity
      x86_64 (debug) - Storage - iSCSI parameters
      x86_64 (debug) - kselftests upstream - net
      x86_64 (debug) - kselftests upstream - bpf
      x86_64 (debug) - kselftests upstream - bpf_test_progs
      x86_64 (debug) - Reboot test
      x86_64 (debug) - CKI/restraint
      x86_64 (debug) - SELinux Custom Module Setup
      x86_64 (debug) - machineinfo
      x86_64 (debug) - Boot test
      x86_64 (debug) - xfstests - ext4
      x86_64 (debug) - xfstests - xfs
      x86_64 (debug) - xfstests - btrfs
      x86_64 (debug) - xfstests - nfsv4.2
      x86_64 (debug) - xfstests - cifsv3.11
      x86_64 (debug) - Reboot test
      x86_64 - CKI/restraint
      x86_64 - SELinux Custom Module Setup
      x86_64 - machineinfo
      x86_64 - Boot test
      x86_64 - POSIX pjd-fstest suites
      x86_64 - Filesystem - Loopdev Sanity
      x86_64 - Memory function: memfd_create
      x86_64 - AMTU (Abstract Machine Test Utility)
      x86_64 - Networking - Ethernet drivers sanity
      x86_64 - Networking cki netfilter test
      x86_64 - Networking vnic: ipvlan/basic
      x86_64 - Libkcapi AF_ALG test
      x86_64 - Hardware - pciutils: sanity smoke test
      x86_64 - Storage - multipath mapping test
      x86_64 - Storage - dm/common
      x86_64 - Storage - lvm thinp sanity
      x86_64 - Storage - iSCSI parameters
      x86_64 - kdump - kexec_boot
      x86_64 - kdump - kexec-file-load
      x86_64 - kselftests upstream - net
      x86_64 - kselftests upstream - bpf
      x86_64 - kselftests upstream - bpf_test_progs
      x86_64 - Reboot test
      x86_64 - CKI/restraint
      x86_64 - SELinux Custom Module Setup
      x86_64 - machineinfo
      x86_64 - Boot test
      x86_64 - kdump - sysrq-c
      x86_64 - kdump - file-load
      x86_64 - Reboot test
      x86_64 - CKI/restraint
      x86_64 - SELinux Custom Module Setup
      x86_64 - machineinfo
      x86_64 - Boot test
      x86_64 - selinux-policy: serge-testsuite
      x86_64 - Reboot test
      x86_64 - CKI/restraint
      x86_64 - SELinux Custom Module Setup
      x86_64 - machineinfo
      x86_64 - Boot test
      x86_64 - xfstests - ext4
      x86_64 - xfstests - xfs
      x86_64 - xfstests - btrfs
      x86_64 - xfstests - nfsv4.2
      x86_64 - xfstests - cifsv3.11
      x86_64 - Reboot test


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

