Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2390B65EB3
	for <llvm@lists.linux.dev>; Tue,  5 Dec 2023 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HtOTMHj4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701786183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zRqW8SG/DCKYan04w9bRNLMdzx0NvH17eSU5z1Aaa8Q=;
	b=HtOTMHj4o5/1hQzvY/1GDdAx3W+5YzuhtHrp0/HGN0LBkuB0VP1zieWSD0EuXL7PPQTAL8
	Ym8VlGOlNNRd+1nWqGPn96hcrIVfirWeCe0qJLFX5ve+LqwPPgOpU6yiwHxlIwlHiL8PwJ
	Vctw7hxJqy06o7C1tAIMmAyaB3ddIic=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-ez5wP-cPPTWmsav9e90nKA-1; Tue, 05 Dec 2023 09:23:02 -0500
X-MC-Unique: ez5wP-cPPTWmsav9e90nKA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A314100DDC5
	for <llvm@lists.linux.dev>; Tue,  5 Dec 2023 14:23:02 +0000 (UTC)
Received: from [172.64.9.23] (unknown [10.30.34.184])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D6FB1C060AF;
	Tue,  5 Dec 2023 14:23:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 7 of 229): Test report for master
 (6.7.0-rc3, mainline.kernel.org-clang, 1b8af655)
Date: Tue, 05 Dec 2023 14:23:02 -0000
To: llvm@lists.linux.dev, yiyan@redhat.com, bhe@redhat.com, xiawu@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Message-Id: <08631.123120509230201527@us-mta-77.us.mimecast.lan>
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
    Commit message: Merge tag 'powerpc-6.7-3' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/powerpc/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/117359

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 - kdump - sysrq-c
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10508329
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /kdump/crash-sysrq-c
          x86_64 - kdump - file-load
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10508330
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /kdump/crash-sysrq-c

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] SELinux is preventing systemd-userdbd from map_rea=
d, map_write access on the bpf labeled init_t.
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2250930
            Affected tests:
                 aarch64 - machineinfo
                 aarch64 - Boot test
                 aarch64 - Hardware - IPMItool loop stress test
                 aarch64 - Storage - blktests - blk
                 aarch64 - Storage - blktests - nvme-tcp
                 aarch64 - Storage - block - queue scheduler test
                 aarch64 - stress: stress-ng - cpu-cache
                 aarch64 - stress: stress-ng - memory
                 aarch64 - Reboot test
                 aarch64 - Hardware - ACPI table test
                 aarch64 - POSIX pjd-fstest suites
                 aarch64 - Filesystem - Loopdev Sanity
                 aarch64 - Memory function: memfd_create
                 aarch64 - AMTU (Abstract Machine Test Utility)
                 aarch64 - Networking - Ethernet drivers sanity
                 aarch64 - Networking cki netfilter test
                 aarch64 - Networking vnic: ipvlan/basic
                 aarch64 - Libkcapi AF_ALG test
                 aarch64 - Storage - multipath mapping test
                 aarch64 - xfstests - ext4
                 aarch64 - xfstests - xfs
                 aarch64 - xfstests - btrfs
                   s390x - machineinfo
                   s390x - Boot test
                   s390x - Storage - blktests - blk
                   s390x - Storage - blktests - nvme-tcp
                   s390x - Storage - swraid scsi_raid
                   s390x - stress: stress-ng - cpu-cache
                   s390x - stress: stress-ng - memory
                   s390x - Reboot test
                   s390x - POSIX pjd-fstest suites
                   s390x - Filesystem - Loopdev Sanity
                   s390x - Memory function: memfd_create
                   s390x - AMTU (Abstract Machine Test Utility)
                   s390x - Networking cki netfilter test
                   s390x - Networking vnic: ipvlan/basic
                   s390x - Libkcapi AF_ALG test
                   s390x - Storage - multipath mapping test
                  x86_64 - machineinfo
                  x86_64 - Boot test
                  x86_64 - Hardware - CPU: Die Test
                  x86_64 - Hardware - IPMItool loop stress test
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - blktests - nvme-tcp
                  x86_64 - Storage - block - queue scheduler test
                  x86_64 - Storage - swraid scsi_raid
                  x86_64 - stress: stress-ng - cpu-cache
                  x86_64 - stress: stress-ng - memory
                  x86_64 - Reboot test
                  x86_64 - Hardware - ACPI table test
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
                  x86_64 - kselftests upstream - net
                  x86_64 - kselftests upstream - bpf_test_progs
                  x86_64 - xfstests - ext4
                  x86_64 - xfstests - xfs
                  x86_64 - xfstests - btrfs
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - machineinfo
                  x86_64 (debug) - Boot test
                  x86_64 (debug) - Hardware - CPU: Die Test
                  x86_64 (debug) - Storage - swraid scsi_raid
                  x86_64 (debug) - Reboot test
                  x86_64 (debug) - Hardware - ACPI table test
                  x86_64 (debug) - POSIX pjd-fstest suites
                  x86_64 (debug) - Filesystem - Loopdev Sanity
                  x86_64 (debug) - AMTU (Abstract Machine Test Utility)
                  x86_64 (debug) - Networking - Ethernet drivers sanity
                  x86_64 (debug) - Networking cki netfilter test
                  x86_64 (debug) - Libkcapi AF_ALG test
                  x86_64 (debug) - Hardware - pciutils: sanity smoke test
                  x86_64 (debug) - Storage - lvm thinp sanity
                  x86_64 (debug) - kselftests upstream - net
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - xfstests - ext4
                  x86_64 (debug) - xfstests - xfs
                  x86_64 (debug) - xfstests - btrfs
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
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
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                 aarch64 - stress: stress-ng - memory
                   s390x - stress: stress-ng - memory
                  x86_64 - stress: stress-ng - memory
        Issue: [upstream] WARNING: CPU: 2 PID: 386 at drivers/gpu/drm/nouve=
au/dispnv50/disp.c:2731 nv50_display_init+0x35f/0x900 [nouveau]
            URL: https://lore.kernel.org/all/20d102ce07031b2d8d63f2f97176eb=
913cfd3efb.camel@intel.com/
            Affected tests:
                  x86_64 - Boot test
                  x86_64 - Reboot test
                  x86_64 (debug) - Boot test
                  x86_64 (debug) - Reboot test
        Issue: xfstests generic/245: cannot overwrite File exists
            URL: https://www.spinics.net/lists/fstests/msg23667.html
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
        Issue: Storage: swraid scsi_raid: WARNING: possible circular lockin=
g dependency detected
            URL: https://datawarehouse.cki-project.org/issue/-/regex/1122
            Affected tests:
                  x86_64 (debug) - Storage - swraid scsi_raid
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite

Tests that were not ran because of internal issues:=20
     aarch64 - CKI/restraint
     aarch64 - SELinux Custom Module Setup
     aarch64 - machineinfo
     aarch64 - Boot test
     aarch64 - selinux-policy: serge-testsuite
     aarch64 - Hardware - Firmware test suite
     aarch64 - Reboot test


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

