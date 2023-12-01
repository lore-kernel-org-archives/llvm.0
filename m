Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C93A4D10B
	for <llvm@lists.linux.dev>; Fri,  1 Dec 2023 17:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TeYF5TUY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701450106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LfdHSiZl3ff11zZh8CWFcHRi+nl7bryICUrHhqS2/PY=;
	b=TeYF5TUY07LDSQJYyo3usFArtNNl590c7I2fwOsfNBSjPuBJCMF1f9exRBhUnizOkMyWKY
	Eds1zJ6mZtH8+JudWupner4ZlEIlIxQjiyKJUa+JItFsLzjotNJCr+1aqEPii216BqBGJG
	EDwlxCOD5CUICPoxtoJgG7QscNvKsPU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-rnSD261WOdKQtqWDC4zsaQ-1; Fri, 01 Dec 2023 12:01:45 -0500
X-MC-Unique: rnSD261WOdKQtqWDC4zsaQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AD74814088
	for <llvm@lists.linux.dev>; Fri,  1 Dec 2023 17:01:45 +0000 (UTC)
Received: from [172.64.4.123] (unknown [10.30.32.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E6A110EA5;
	Fri,  1 Dec 2023 17:01:45 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (6.7.0-rc3,
 mainline.kernel.org-clang, 994d5c58)
Date: Fri, 01 Dec 2023 17:01:45 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Message-Id: <85252.123120112014501445@us-mta-434.us.mimecast.lan>
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
    Commit message: Merge tag 'hardening-v6.7-rc4' of git://git.kernel.org/=
pub/scm/linux/kernel/git/kees/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/117184

One or more kernel tests failed:
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
                 aarch64 - Storage - block - filesystem fio test
                 aarch64 - Storage - block - queue scheduler test
                 aarch64 - stress: stress-ng - cpu-cache
                 aarch64 - stress: stress-ng - memory
                 aarch64 - Reboot test
                 aarch64 - Hardware - ACPI table test
                 aarch64 - POSIX pjd-fstest suites
                 aarch64 - Filesystem - Loopdev Sanity
                 aarch64 - Memory function: memfd_create
                 aarch64 - AMTU (Abstract Machine Test Utility)
                 aarch64 - Networking cki netfilter test
                 aarch64 - Networking vnic: ipvlan/basic
                 aarch64 - Libkcapi AF_ALG test
                 aarch64 - Storage - multipath mapping test
                 aarch64 - Storage - lvm thinp sanity
                 aarch64 - Hardware - Firmware test suite
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
                  x86_64 - AMTU (Abstract Machine Test Utility)
                  x86_64 - Networking - Ethernet drivers sanity
                  x86_64 - Networking cki netfilter test
                  x86_64 - Networking vnic: ipvlan/basic
                  x86_64 - Libkcapi AF_ALG test
                  x86_64 - Hardware - pciutils: sanity smoke test
                  x86_64 - Storage - multipath mapping test
                  x86_64 - kselftests upstream - net
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
                  x86_64 (debug) - Memory function: memfd_create
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
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: blktests block/024 failed
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2128603
            Affected tests:
                   s390x - Storage - blktests - blk
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
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite



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

