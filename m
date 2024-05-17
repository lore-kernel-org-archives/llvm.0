Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6261D38F
	for <llvm@lists.linux.dev>; Fri, 17 May 2024 00:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715907163; cv=none; b=npzgVnRDxrTKcaIhR6SBhHZb3q79KjGjxiP42tQpdu7YqEgr+w3M5FQZ5jL1KLDih5McgX2KYo5fg2kD/nisax3yA8d7fZwV33nusXEwh4gz0jA/f6z6XhtN+6I2ZCguqLbBSxjDLNtQarqv7tMeQoEhL9LIswgnnJrG4fSfbrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715907163; c=relaxed/simple;
	bh=gQqe+8T26wZUSFay3/trJGnBTthmxt+iFNmFVZ30Vr8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=jkKec6Nd9Cv/Jv8IwJhARI0XLIzqPhB9KSrXKDbeXSfd0JvY8Ic22j0ncwzgR+xARgLjsMsXvtutfGB4ae4xYjLyULDtN5rYlSipQIkaxzaNN7wBbUrO63/S3WIKEjE9oH3m9q+fZ0rRJR1TLcewInPzp3NresIPtIUX68urGZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UIHHFkFo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UIHHFkFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715907160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FZGd0f0VoDQB1VfYyjxvSEttIiIIdGwSeWGcfXOogaU=;
	b=UIHHFkFoxBn4EzKKy7BwK6LiXOHrIWuBGSX1NHfBAyXD4tYVHH4a5py1GjN6VH8ey60YwD
	oAqrnpZoUVgw0Zg5xZ38FI3B0DaswI32uCnMye4bS6RWqmwnpQeEElPxpKXriWW1IaHeRt
	U9S8M6p2L86RSWPbWB9Fh+T65aFsXOY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-488-DPIJfitVOd2vPTR9FkgsIg-1; Thu,
 16 May 2024 20:52:36 -0400
X-MC-Unique: DPIJfitVOd2vPTR9FkgsIg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C00329AA2D2
	for <llvm@lists.linux.dev>; Fri, 17 May 2024 00:52:36 +0000 (UTC)
Received: from [172.64.13.32] (unknown [10.30.32.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 060322026D68;
	Fri, 17 May 2024 00:52:36 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 5 of 204): Test report for master
 (6.9.0, mainline.kernel.org-clang, 6fd600d7)
Date: Fri, 17 May 2024 00:52:35 -0000
To: xzhou@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Message-Id: <84603.124051620523600207@us-mta-488.us.mimecast.lan>
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
    Commit message: Merge tag 'media/v6.10-1' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/mchehab/linux-media

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1293845753

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - cifsv3.11
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1293845753-x86_64-kernel-debug_upt_32
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/001
                       =E2=9D=8C FAIL generic/100
                       =E2=9D=8C FAIL generic/123

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [eln] avc:  denied  { create } for  pid=3D1 comm=3D"systemd"=
 scontext=3Dsystem_u:system_r:init_t:s0 tcontext=3Dsystem_u:system_r:sshd_t=
:s0-s0:c0.c1023 tclass=3Dvsock_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2280320
            Affected tests:
                AMTU (Abstract Machine Test Utility) [aarch64, ppc64le, s39=
0x]
                Boot test [aarch64, ppc64le, s390x, x86_64, x86_64 (debug)]
                Hardware - Firmware test suite [aarch64]
                Hardware - pciutils: sanity smoke test [x86_64]
                kselftests upstream - bpf [x86_64]
                kselftests upstream - net [x86_64]
                Libkcapi AF_ALG test [aarch64, ppc64le, s390x, x86_64]
                Memory function: memfd_create [aarch64, ppc64le, s390x, x86=
_64]
                Networking cki netfilter test [aarch64, ppc64le, s390x, x86=
_64]
                Networking vnic: ipvlan/basic [aarch64, ppc64le, s390x, x86=
_64]
                POSIX pjd-fstest suites [aarch64, ppc64le, s390x, x86_64]
                Reboot test [aarch64, ppc64le, s390x, x86_64]
                Storage - blktests - blk - upstream [s390x]
                Storage - blktests - nvme-tcp - upstream [s390x]
                Storage - swraid scsi_raid [s390x]
                stress: stress-ng - cpu-cache [aarch64, s390x, x86_64]
                stress: stress-ng - memory [s390x]
                xfstests - btrfs [aarch64, x86_64]
                xfstests - cifsv3.11 [x86_64]
                xfstests - ext4 [aarch64, x86_64]
                xfstests - nfsv4.2 [x86_64]
                xfstests - xfs [aarch64, x86_64]
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
                stress: stress-ng - memory [aarch64, s390x, x86_64]
        Issue: Storage nvme - rdma: nvme/014 - flush: Interrupted system ca=
ll
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1980181
            Affected tests:
                Storage - blktests - nvme-tcp - upstream [x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]


Tests that were not ran because of internal issues:=20
    machineinfo [ppc64le]
    Reboot test [ppc64le]
    SELinux Custom Module Setup [ppc64le, x86_64]
    selinux-policy: serge-testsuite [ppc64le]


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

