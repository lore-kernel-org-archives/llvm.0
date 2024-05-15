Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64CB46424
	for <llvm@lists.linux.dev>; Wed, 15 May 2024 07:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715758318; cv=none; b=qEts5ksWAXKrP5E2Q+jpiU+6Zmb///6zXgZ7J2T7GXawe4N14U9Vq2NO31BWQpXup3Ko4Q2Z4iUXDYNcJlN4URE8auJ7d0LQBy1DkBa3c7bQgJh0uQsnzfgfvp9CkGyYqKX6up9fXd9YAG32so/T6mnP/hAPYt9lYzes40jKzMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715758318; c=relaxed/simple;
	bh=ojbXq7GcWQ1UOnZJJAvS4hnLAdEY2xrPbEnJ6jglu1o=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=g0J6dDFips/WEWiCcERPVFjI9zBw6vSfO80nrLg3fPiX+21qJujeuanixyn4PIZwff5lWU+WS7k+qMzqUdnD9QZj8lZOn78k830QZsYRv6yVvN7CT4UyS5WlMM0AxHNqjqgLBPYyxP9huua9jNBxJFkCXVfBBXhSirfmtbfD4Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gs95Cr9a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gs95Cr9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715758314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xF8Nl8Smw2c2EmrdWS1gfq+dd3FSQcovfq/DRSwg6U0=;
	b=gs95Cr9a6sEdrpbWzwF7ZTMER6+1IMeAnQI8Wp2QdVUOVXAVErAZzjKuGHZTYsgykM33vJ
	fqAapF4gvm45Kb+IxjSchIJSbGGat/TP1jMe0h0x4ehbXCyBOG1HApdmovti2aWkeQiP8/
	klML1KuZRvpThM2uC+gVWOr1Kw9kvqU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-vZ7ZkpC3M3e__iP9g49gwA-1; Wed, 15 May 2024 03:31:53 -0400
X-MC-Unique: vZ7ZkpC3M3e__iP9g49gwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFE7D80021D;
	Wed, 15 May 2024 07:31:52 +0000 (UTC)
Received: from [172.64.3.40] (unknown [10.30.33.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18E04200BAB1;
	Wed, 15 May 2024 07:31:52 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 6 of 204): Test report for master
 (6.9.0, mainline.kernel.org-clang, 101b7a97)
Date: Wed, 15 May 2024 07:31:52 -0000
To: bgoncalv@redhat.com, haliu@redhat.com, llvm@lists.linux.dev,
 omosnace@redhat.com, jiji@redhat.com, yizhan@redhat.com, jishi@redhat.com,
 zlang@redhat.com, shinichiro.kawasaki@wdc.com, xzhou@redhat.com,
 mm-qe@redhat.com, wgomerin@redhat.com, yiche@redhat.com, jbastian@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Message-Id: <78333.124051503315300147@us-mta-38.us.mimecast.lan>
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
    Commit message: Merge tag 'acpi-6.10-rc1' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1290918573

One or more kernel tests failed:
    Unrecognized or new issues:
        AMTU (Abstract Machine Test Utility)
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-x86_64-kernel_upt_18
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-aarch64-kernel_upt_18
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-ppc64le-kernel_upt_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-aarch64-kernel_upt_4
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-x86_64-kernel-debug_upt_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-x86_64-kernel-debug_upt_27
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Filesystem - Loopdev Sanity
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-ppc64le-kernel_upt_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Hardware - pciutils: sanity smoke test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-x86_64-kernel_upt_23
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Libkcapi AF_ALG test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-x86_64-kernel_upt_22
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-aarch64-kernel_upt_22
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-ppc64le-kernel_upt_12
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Networking cki netfilter test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-x86_64-kernel_upt_20
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-aarch64-kernel_upt_20
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-ppc64le-kernel_upt_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
        Networking vnic: ipvlan/basic
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-x86_64-kernel_upt_21
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-aarch64-kernel_upt_21
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-ppc64le-kernel_upt_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        POSIX pjd-fstest suites
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-x86_64-kernel_upt_15
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-aarch64-kernel_upt_15
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-ppc64le-kernel_upt_5
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Reboot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-aarch64-kernel_upt_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Storage - blktests - nvme-tcp - upstream
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-s390x-kernel_upt_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
        stress: stress-ng - cpu-cache
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-aarch64-kernel_upt_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-x86_64-kernel_upt_50
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-aarch64-kernel_upt_46
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
        xfstests - cifsv3.11
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-x86_64-kernel_upt_52
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL generic/001
                       =E2=9A=A1 ERROR /10_localwatchdog
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-x86_64-kernel-debug_upt_32
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic
        xfstests - ext4
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-x86_64-kernel_upt_48
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-aarch64-kernel_upt_44
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
        xfstests - nfsv4.2
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-x86_64-kernel-debug_upt_31
        xfstests - xfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-x86_64-kernel_upt_49
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290918573-aarch64-kernel_upt_45
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [eln] avc:  denied  { create } for  pid=3D1 comm=3D"systemd"=
 scontext=3Dsystem_u:system_r:init_t:s0 tcontext=3Dsystem_u:system_r:sshd_t=
:s0-s0:c0.c1023 tclass=3Dvsock_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2280320
            Affected tests:
                Boot test [aarch64, ppc64le, s390x, x86_64]
                Reboot test [aarch64, ppc64le, s390x, x86_64]
                stress: stress-ng - cpu-cache [s390x, x86_64]
        Issue: [upstream] blktests tests/zbd/010 failed (WARNING: CPU: 22 P=
ID: 44011 at fs/iomap/iter.c:51)
            URL: https://lore.kernel.org/linux-block/CAHj4cs-kfojYC9i0G73PR=
kYzcxCTex=3D-vugRFeP40g_URGvnfQ@mail.gmail.com/T/#u
            Affected tests:
                Storage - blktests - blk - upstream [aarch64, s390x, x86_64=
]
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                stress: stress-ng - memory [s390x, x86_64]
        Issue: [Rawhide] kdump - kexec_boot: [ ERROR ] :: Kexec boot failed=
. Expect to see newkerneloption in kernel boot options
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2057391
            Affected tests:
                kdump - kexec-file-load [x86_64]
        Issue: kdump - kexec-file-load: Kexec boot failed as fileloadoption=
 is not seen in kernel boot options
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1433
            Affected tests:
                kdump - kexec-file-load [x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: [rawhide] [s390x] avc:  denied  { read write } for  pid=3D12=
701 comm=3D"systemd-user-ru" name=3D"z90crypt" dev=3D"devtmpfs" ino=3D103 s=
context=3Dsystem_u:system_r:systemd_logind_t:s0 tcontext=3Dsystem_u:object_=
r:crypt_device_t:s0 tclass=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2263825
            Affected tests:
                AMTU (Abstract Machine Test Utility) [s390x]
                Boot test [s390x]
                Filesystem - Loopdev Sanity [s390x]
                Libkcapi AF_ALG test [s390x]
                machineinfo [s390x]
                Networking cki netfilter test [s390x]
                Networking vnic: ipvlan/basic [s390x]
                POSIX pjd-fstest suites [s390x]
                Reboot test [s390x]
                Storage - blktests - blk - upstream [s390x]
                Storage - swraid scsi_raid [s390x]
                stress: stress-ng - cpu-cache [s390x]
                stress: stress-ng - memory [s390x]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:=20
    Memory function: memfd_create [aarch64, ppc64le, s390x, x86_64, x86_64 =
(debug)]
    Reboot test [x86_64 (debug)]


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

