Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D604134433
	for <llvm@lists.linux.dev>; Sun, 14 Apr 2024 23:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713138656; cv=none; b=Co0qd5gCwOX7XDS+bu8nUTIHdZpfXaZPxyH7yD0VDKyUpDAGky8lGqp3qyN5f4cleZNHkMROIkWaShoRQ4yBE5+u5o+DYFO9Upe1Q91CRWs2vOP5Foge1IFMdmQ+/S22Cj1sEnqzafCmIuAQjTTRkIRrMexwSvDz/cseDfE6JAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713138656; c=relaxed/simple;
	bh=WgBjh6NeBrBESE+mZyKdBEB6ZAUvoc5Rc2DAO0puYEY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=SsMrWc4/ZoWFVaNjs1cwQEt/8pBlvaKBKq4PkUysCLB4e8UB4dZ6xskTAjTQcbki/kA+LEbxnMi39CY3SrU22ow6bN12q8+VNMOb89h+bqQAuLy/3ewyM0MB1swmzsV/AJwXIep0e7x/ZUgTcTUdaJ53Lg126n3FioKddiDLOUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BRZpAwH5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BRZpAwH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713138653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G4GYqJEsxVG4D2GN56Zm0/0NYJbz6TrcxJ7/EAuwY8c=;
	b=BRZpAwH52lN77ReOhsAQg7MXIAKGlnYynrXOvwrk9JAxofrRTSGLJDgHbdmOMux/oxP+t5
	mYkR+0GpfK4nOo0zYPdI57b5/RENK9Wvd3CnSnjQyCqx2xwISQjQamjoiT+eb3DnEsHd1I
	xWGht5c26TGJtGA56kZiObN4igrhQQE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-590-hM4KfH7FNw6UFOQ5M_P93Q-1; Sun,
 14 Apr 2024 19:50:52 -0400
X-MC-Unique: hM4KfH7FNw6UFOQ5M_P93Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C73DC3806720
	for <llvm@lists.linux.dev>; Sun, 14 Apr 2024 23:50:51 +0000 (UTC)
Received: from [172.64.9.46] (unknown [10.30.34.184])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7984D51EF;
	Sun, 14 Apr 2024 23:50:51 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 21 of 204): Test report for master
 (6.9.0-rc3, mainline.kernel.org-clang, 52e5070f)
Date: Sun, 14 Apr 2024 23:50:51 -0000
To: xzhou@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Message-Id: <93931.124041419505200165@us-mta-590.us.mimecast.lan>
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
    Commit message: Merge tag 'hyperv-fixes-signed-20240411' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/hyperv/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/140420

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - cifsv3.11
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
12005604
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/310

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
        Issue: [upstream] blktests tests/zbd/010 failed (WARNING: CPU: 22 P=
ID: 44011 at fs/iomap/iter.c:51)
            URL: https://lore.kernel.org/linux-block/CAHj4cs-kfojYC9i0G73PR=
kYzcxCTex=3D-vugRFeP40g_URGvnfQ@mail.gmail.com/T/#u
            Affected tests:
                Storage - blktests - blk - upstream [aarch64, s390x]
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                stress: stress-ng - memory [aarch64, s390x]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
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


Tests that were not ran because of internal issues:=20
    Boot test [x86_64, x86_64 (debug)]
    CKI/restraint [x86_64, x86_64 (debug)]
    machineinfo [x86_64, x86_64 (debug)]
    Memory function: memfd_create [aarch64, ppc64le, s390x, x86_64, x86_64 =
(debug)]
    Reboot test [x86_64, x86_64 (debug)]
    SELinux Custom Module Setup [x86_64, x86_64 (debug)]
    Storage - blktests - blk - upstream [x86_64]
    Storage - blktests - nvme-tcp - upstream [x86_64]
    Storage - swraid scsi_raid [x86_64, x86_64 (debug)]
    stress: stress-ng - cpu-cache [x86_64]
    stress: stress-ng - memory [x86_64]


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

