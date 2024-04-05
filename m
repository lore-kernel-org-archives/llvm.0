Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5022416F284
	for <llvm@lists.linux.dev>; Fri,  5 Apr 2024 14:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712328081; cv=none; b=Sj5JacV82nPTU3obM/6YImwkEY5gQjQIWuB4K/wsVWhKNBbfJ46hK387B24R+nXlerSYF+i47ySHI/EngsojlNGalVTds1drhFvxopjE8AKNLlmQ6Y56Mc392GRdxVSDXzqPggAgX0JR0yvv8VQX7DAhKUKa25RqVohABciGGgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712328081; c=relaxed/simple;
	bh=xysLvei3ccvFbGrLpvnyRv8yuZ4bQg4XJELIQkeJXxw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Hd9gVlVdzp83FDyrcdQXb50VYiWnWreTbwAHvjw1AjqQsBvbZmd8bLi6ZalHJUCR9kCIWZPN6KO9kmS3x1xwTAS+hr3vV+DchqRZxnW1Qj8p3O853onyRNwOQDE0XBwCpqUIA3CffsF2k4MJZ/5sTu9Ud/LXym5c+Zh5f+wwHNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jISChc9o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jISChc9o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712328078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H0C/gkutRxLR9OvZHv3CTDJPFUY+0Z2ILw2AXG6wbJA=;
	b=jISChc9oqqSt1dNrPilG9pIa8P5eOuPUFSse7qf7OUXmZ3hHpzU8hqc1e5Myx2eQu0HZNQ
	1t6qQgPAwKELgYBaUd8UBkzIluMGEUm9tq6lYREMQ6RqYjYj1165ODR9jHUkjYe9p1gUH4
	w10OxsstC7YlOTcBvkCp+LS4aoZJnUk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-7tmEFcPhOby7Fx7uw1HPwQ-1; Fri, 05 Apr 2024 10:41:17 -0400
X-MC-Unique: 7tmEFcPhOby7Fx7uw1HPwQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBFE2185A787
	for <llvm@lists.linux.dev>; Fri,  5 Apr 2024 14:41:15 +0000 (UTC)
Received: from [172.64.13.37] (unknown [10.30.32.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 77332111F3C6;
	Fri,  5 Apr 2024 14:41:15 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 21 of 204): Test report for master
 (6.9.0-rc2, mainline.kernel.org-clang, c88b9b4c)
Date: Fri, 05 Apr 2024 14:41:15 -0000
To: xzhou@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Message-Id: <77370.124040510411700501@us-mta-562.us.mimecast.lan>
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
    Commit message: Merge tag 'net-6.9-rc3' of git://git.kernel.org/pub/scm=
/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/139152

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - cifsv3.11
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11915165
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/129
                       =E2=9D=8C FAIL generic/135
                       =E2=9D=8C FAIL generic/141
                       =E2=9D=8C FAIL generic/169
                       =E2=9D=8C FAIL generic/198
                       =E2=9D=8C FAIL generic/207
                       =E2=9D=8C FAIL generic/208
                       =E2=9D=8C FAIL generic/210
                       =E2=9D=8C FAIL generic/211
                       =E2=9D=8C FAIL generic/212
                       =E2=9D=8C FAIL generic/214
                       =E2=9D=8C FAIL generic/221
                       =E2=9D=8C FAIL generic/245
                       =E2=9D=8C FAIL generic/246
                       =E2=9D=8C FAIL generic/248
                       =E2=9D=8C FAIL generic/249
                       =E2=9D=8C FAIL generic/257
                       =E2=9D=8C FAIL generic/308
                       =E2=9D=8C FAIL generic/309
                       =E2=9D=8C FAIL generic/310
                       =E2=9D=8C FAIL generic/339
                       =E2=9D=8C FAIL generic/340
        xfstests - nfsv4.2
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11915164
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/129
                       =E2=9D=8C FAIL generic/354

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [Rawhide] readpage_elf: Attempt to read non-existent page at=
 __exclude_unnecessary_pages: Can't read the buffer of struct page
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2269991
            Affected tests:
                kdump - file-load [ppc64le]
                kdump - sysrq-c [ppc64le]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
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

