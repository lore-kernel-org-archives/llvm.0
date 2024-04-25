Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2548B4C62
	for <llvm@lists.linux.dev>; Thu, 25 Apr 2024 00:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714006298; cv=none; b=M8gVbHGpHJpQKbw83Z7aNTlZR6IV4pzXRatcdMruuqTsP/90FYtiaDF0TRQLVaCRhmDEGhv8RkK6Sv4cwSTWNAkBDSvD97oJfMaxIcOKVRCjE5m68xJSRXD2FfvaPxMhqkG+Kv5mO2g9EWH0b2Y0JYjtPJhQECst2DIhGMmTOa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714006298; c=relaxed/simple;
	bh=bmA5W59bjOUhXkf7OBLDAHjrT4uFDV4qBxfl5r0BsNw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=XHXAmzIzjpvQyoKguGU+N/zN3RKs0fB1uLf6wOLhy5KIVj70c5aB+LWMOHLPHjmdAvMIyQ/6H1u7TejsTEw/eI+0KaoqkB18rNX8yQlqGtM1WHqkT0uUMMRgzXoanQ61ILWeO89PvI6EYrxb2K+RjPzozdNhZ8KygcnF0W3F4Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XPPL6n4c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XPPL6n4c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714006295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+NDZDqzPDzd97rkO4DJ//nmK8G6OVJoTlVTgA6K0I4c=;
	b=XPPL6n4cTe0wAGI0MviVsR6r5yeNdywYvDdjrciyy3E+AENFiCg2wfsGQIMX5X8aMLvGFv
	pA1bLaBzkR2WUhR0h89StY4cez+aLjC+CY/uHneX69ZFk2wl9gBlW5saA7W8FvcJymGgYP
	Kp0UIeheO7sRc8Jd3CV9QjjStK7wxm8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-6-PXRJmHoYNYivBKLlLLWODQ-1; Wed,
 24 Apr 2024 20:51:33 -0400
X-MC-Unique: PXRJmHoYNYivBKLlLLWODQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 079E029AC028
	for <llvm@lists.linux.dev>; Thu, 25 Apr 2024 00:51:33 +0000 (UTC)
Received: from [172.64.4.17] (unknown [10.30.33.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B2DF5C13FA3;
	Thu, 25 Apr 2024 00:51:32 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 11 of 204): Test report for master
 (6.9.0-rc5, mainline.kernel.org-clang, e88c4cfc)
Date: Thu, 25 Apr 2024 00:51:32 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Message-Id: <34264.124042420513300206@us-mta-6.us.mimecast.lan>
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
    Commit message: Merge tag 'for-6.9-rc5-tag' of git://git.kernel.org/pub=
/scm/linux/kernel/git/kdave/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1266436500

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] blktests tests/zbd/010 failed (WARNING: CPU: 22 P=
ID: 44011 at fs/iomap/iter.c:51)
            URL: https://lore.kernel.org/linux-block/CAHj4cs-kfojYC9i0G73PR=
kYzcxCTex=3D-vugRFeP40g_URGvnfQ@mail.gmail.com/T/#u
            Affected tests:
                Storage - blktests - blk - upstream [aarch64, s390x, x86_64=
]
        Issue: [Rawhide] avc:  denied  { getattr } for  pid=3D79656 comm=3D=
"selinux-autorel" path=3D"/etc/passwd" dev=3D"dm-0" ino=3D17705170 scontext=
=3Dsystem_u:system_r:selinux_autorelabel_generator_t:s0 tcontext=3Dsystem_u=
:object_r:passwd_file_t:s0 tclass=3Dfile permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2275266
            Affected tests:
                Filesystem - Loopdev Sanity [aarch64, ppc64le, s390x, x86_6=
4]
                Networking cki netfilter test [aarch64, ppc64le, s390x, x86=
_64]
                Networking vnic: ipvlan/basic [aarch64, ppc64le, s390x, x86=
_64]
                POSIX pjd-fstest suites [aarch64, ppc64le, s390x, x86_64]
                Storage - blktests - blk - upstream [aarch64, s390x, x86_64=
]
                stress: stress-ng - cpu-cache [aarch64, s390x, x86_64]
                stress: stress-ng - memory [aarch64, s390x, x86_64]
                xfstests - btrfs [aarch64, x86_64]
                xfstests - ext4 [aarch64, x86_64]
                xfstests - xfs [aarch64, x86_64]
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                stress: stress-ng - memory [aarch64, s390x, x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: kselftests: bpf:test_tunnel.sh [FAIL]
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1749
            Affected tests:
                kselftests upstream - bpf [x86_64 (debug)]
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
                Storage - blktests - nvme-tcp - upstream [s390x]
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
    Boot test [x86_64 (debug)]
    CKI/restraint [x86_64 (debug)]
    machineinfo [x86_64 (debug)]
    Memory function: memfd_create [aarch64, ppc64le, s390x, x86_64, x86_64 =
(debug)]
    Reboot test [x86_64 (debug)]
    SELinux Custom Module Setup [x86_64 (debug)]
    Storage - swraid scsi_raid [x86_64 (debug)]


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

