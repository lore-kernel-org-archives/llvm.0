Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7B7364DC
	for <llvm@lists.linux.dev>; Wed, 15 May 2024 02:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715741500; cv=none; b=lgz1O5oVRrIVjtMshsILOlCpkXG200Ht/YqfTDtq1TsdIL/GOozIaOinrd/+ggzDvJ60repJ2gRmsNr9TjoZZxMqIzDHFd22jnwYfxL18HulnnNT1R3YEYSEQBckFZciigZ/kKz06+qU/UI+ddjJyu+ov7IrzJS27tpjYMANbL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715741500; c=relaxed/simple;
	bh=pu2lU16Y4c56FXIaKPyhR11pNNS+KvuXvg3XEjapT8E=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=YNTgS9YPRUoCyseZNJ2q74P1QehQeyNWbmd5Ek/obrj0FyRYyjOA5a08W5bj1ISD/esSTla756Js3YUgqrusVJ3KEyfV89eErIkxX3z06WfKq4Ucg7vV2rjUmVTRD4Fr/UoVhRy1TyQYFb9AyA0ePev8D6n0H2p8/YpAng4oStY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hN7E8qBg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hN7E8qBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715741496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tL1ZsaNhL7+c4AbVb3IYqeD/HseigkvaGplbOCHE1AI=;
	b=hN7E8qBgh68XQ/TGurHxQZWLtCXLeopEEVhI8dR0z/0X3d+iA2IuSzicxL1eKhzw32ZLYz
	avk8n6z8PJe6Q2pRNs7trSeG2DV0Zm/0DLmJzHyINHaS/9R0JgD5iGMTxfroav6x5PHdUq
	v8ZjlQZCRpucorn+BnQDT/DXtXIc0/8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-znGJPuN6Pq6K-KhTG5fI3w-1; Tue, 14 May 2024 22:51:35 -0400
X-MC-Unique: znGJPuN6Pq6K-KhTG5fI3w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 265D1857A81;
	Wed, 15 May 2024 02:51:35 +0000 (UTC)
Received: from [172.64.3.40] (unknown [10.30.33.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79F41200B4D6;
	Wed, 15 May 2024 02:51:34 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 19 of 204): Test report for master
 (6.9.0, mainline.kernel.org-clang, 6bfd2d44)
Date: Wed, 15 May 2024 02:51:34 -0000
To: bgoncalv@redhat.com, haliu@redhat.com, llvm@lists.linux.dev,
 omosnace@redhat.com, jiji@redhat.com, yizhan@redhat.com, jishi@redhat.com,
 zlang@redhat.com, shinichiro.kawasaki@wdc.com, xzhou@redhat.com,
 mm-qe@redhat.com, wgomerin@redhat.com, yiche@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Message-Id: <95273.124051422513500349@us-mta-662.us.mimecast.lan>
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
    Commit message: Merge tag 'irq-core-2024-05-12' of git://git.kernel.org=
/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1290624276

One or more kernel tests failed:
    Unrecognized or new issues:
        AMTU (Abstract Machine Test Utility)
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-aarch64-kernel_upt_18
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-ppc64le-kernel_upt_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-x86_64-kernel_upt_4
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-aarch64-kernel_upt_4
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-x86_64-kernel-debug_upt_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-x86_64-kernel-debug_upt_27
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Filesystem - Loopdev Sanity
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-ppc64le-kernel_upt_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
        Hardware - pciutils: sanity smoke test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-x86_64-kernel_upt_23
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Libkcapi AF_ALG test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-x86_64-kernel_upt_22
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-aarch64-kernel_upt_22
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-ppc64le-kernel_upt_12
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Networking cki netfilter test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-x86_64-kernel_upt_20
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-aarch64-kernel_upt_20
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-ppc64le-kernel_upt_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Networking vnic: ipvlan/basic
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-x86_64-kernel_upt_21
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-aarch64-kernel_upt_21
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-ppc64le-kernel_upt_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        POSIX pjd-fstest suites
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-x86_64-kernel_upt_15
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-aarch64-kernel_upt_15
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-ppc64le-kernel_upt_5
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Storage - blktests - blk - upstream
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-aarch64-kernel_upt_5
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic
        Storage - blktests - nvme-tcp - upstream
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-s390x-kernel_upt_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-x86_64-kernel_upt_50
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-aarch64-kernel_upt_46
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
        xfstests - cifsv3.11
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-x86_64-kernel_upt_52
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL generic/001
                       =E2=9A=A1 ERROR /10_localwatchdog
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-x86_64-kernel-debug_upt_32
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic
        xfstests - ext4
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-x86_64-kernel_upt_48
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-aarch64-kernel_upt_44
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-x86_64-kernel_upt_51
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
        xfstests - xfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-x86_64-kernel_upt_49
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1290624276-aarch64-kernel_upt_45
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] [s390x] avc:  denied  { read write } for  pid=3D12=
701 comm=3D"systemd-user-ru" name=3D"z90crypt" dev=3D"devtmpfs" ino=3D103 s=
context=3Dsystem_u:system_r:systemd_logind_t:s0 tcontext=3Dsystem_u:object_=
r:crypt_device_t:s0 tclass=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2263825
            Affected tests:
                AMTU (Abstract Machine Test Utility) [s390x]
                Boot test [s390x]
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
        Issue: [eln] avc:  denied  { create } for  pid=3D1 comm=3D"systemd"=
 scontext=3Dsystem_u:system_r:init_t:s0 tcontext=3Dsystem_u:system_r:sshd_t=
:s0-s0:c0.c1023 tclass=3Dvsock_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2280320
            Affected tests:
                Boot test [aarch64, ppc64le, s390x, x86_64]
                Reboot test [aarch64, ppc64le, s390x, x86_64]
                stress: stress-ng - cpu-cache [s390x]
        Issue: [upstream] blktests tests/zbd/010 failed (WARNING: CPU: 22 P=
ID: 44011 at fs/iomap/iter.c:51)
            URL: https://lore.kernel.org/linux-block/CAHj4cs-kfojYC9i0G73PR=
kYzcxCTex=3D-vugRFeP40g_URGvnfQ@mail.gmail.com/T/#u
            Affected tests:
                Storage - blktests - blk - upstream [s390x]
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                stress: stress-ng - memory [s390x]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:=20
    machineinfo [x86_64 (debug)]
    Memory function: memfd_create [aarch64, ppc64le, s390x, x86_64, x86_64 =
(debug)]
    Reboot test [aarch64, x86_64, x86_64 (debug)]
    SELinux Custom Module Setup [x86_64 (debug)]
    Storage - blktests - blk - upstream [x86_64]
    Storage - blktests - nvme-tcp - upstream [aarch64, x86_64]
    Storage - swraid scsi_raid [aarch64, x86_64]
    stress: stress-ng - cpu-cache [aarch64, x86_64]
    stress: stress-ng - memory [aarch64, x86_64]


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

