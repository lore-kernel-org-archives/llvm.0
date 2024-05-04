Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3725857CB5
	for <llvm@lists.linux.dev>; Sat,  4 May 2024 05:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714801299; cv=none; b=GYTM1Ef+vQlZFtX2yQG6o29F3DpGZcDfDF+naUf30VeK8dK8IZ2ILASUXPK37QuNkPOn5cm7U14xYHATIqAwcmkdoKi2GHhTvAFjIKVYd/8h/xvwLjikd9TYK+hCOzJ6vEn495PMBDamHiWmxqC/NPt4+UqotsOYg5rF5EML1oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714801299; c=relaxed/simple;
	bh=Zt6BDncFaQl/RQbIfrG7tmkrkqybMbvZOhhSYj5enrY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Az7QsYY7dzm3xhxZEuV41vk660eh6ov2UwWy2N92Ug6YrZqKu7FbfkxiRipDn89XL4yKGG6VRZhLBA8WCOcpcaxiZqkIcv7lguNAFtVcHbg4WZKPicGEvljbliyg8jReAVZtX+3v6remDg5Z+0Pych9VgykrD5DqJz97ZEnOel0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dqi4H2Zq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dqi4H2Zq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714801296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gAOkFLMkD0/fC3uQ9e4OlXmEobZTH+Xm3il5C5T3TP0=;
	b=dqi4H2Zq2eb/hP+ALYbIcmkhvRwZokulGyWi6EAXOkMfdmPozCgvRowY9zjijuLs9JBwHj
	ROB7WKOaLtKj9/vAZokbR6bLTaVVo78C5BB0PXIAlZYoyxRmZc4GrVQfd66Qg4QSuJBR1E
	l3Mq5wAZb3zOccahk96Iw7KP0ggogH8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-bQAssZIePJ2aifYBdUBreA-1; Sat,
 04 May 2024 01:41:34 -0400
X-MC-Unique: bQAssZIePJ2aifYBdUBreA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 775E529AA38B
	for <llvm@lists.linux.dev>; Sat,  4 May 2024 05:41:34 +0000 (UTC)
Received: from [172.64.14.47] (unknown [10.30.32.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1CB7D1C0654B;
	Sat,  4 May 2024 05:41:34 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 5 of 204): Test report for master
 (6.9.0-rc6, mainline.kernel.org-clang, f03359bc)
Date: Sat, 04 May 2024 05:41:34 -0000
To: bgoncalv@redhat.com, xiawu@redhat.com, xzhou@redhat.com,
 llvm@lists.linux.dev, yiyan@redhat.com, bhe@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Message-Id: <92345.124050401413400435@us-mta-126.us.mimecast.lan>
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
    Commit message: Merge tag 'for-6.9-rc6-tag' of git://git.kernel.org/pub=
/scm/linux/kernel/git/kdave/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1276466578

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1276466578-x86_64-kernel-debug_upt_4
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        kdump - kexec-file-load
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1276466578-x86_64-kernel_upt_26
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /kdump/kexec-file-load
        Reboot test
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1276466578-x86_64-kernel-debug_upt_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        xfstests - cifsv3.11
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1276466578-x86_64-kernel-debug_upt_32
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/354
                       =E2=9D=8C FAIL generic/406
                       =E2=9D=8C FAIL generic/420
                       =E2=9D=8C FAIL generic/433
                       =E2=9D=8C FAIL generic/439
                       =E2=9D=8C FAIL generic/446
                       =E2=9D=8C FAIL generic/451
                       =E2=9D=8C FAIL generic/452
                       =E2=9D=8C FAIL generic/524
                       =E2=9D=8C FAIL generic/565
                       =E2=9D=8C FAIL generic/590
                       =E2=9D=8C FAIL generic/591
        xfstests - ext4
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1276466578-x86_64-kernel-debug_upt_28
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/001
                       =E2=9D=8C FAIL generic/006
                       =E2=9D=8C FAIL generic/007
                       =E2=9D=8C FAIL generic/012
                       =E2=9D=8C FAIL generic/016
                       =E2=9D=8C FAIL generic/022
                       =E2=9D=8C FAIL generic/023
                       =E2=9D=8C FAIL generic/024
                       =E2=9D=8C FAIL generic/025
                       =E2=9D=8C FAIL generic/030
        xfstests - nfsv4.2
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1276466578-x86_64-kernel-debug_upt_31

    We also see the following known issues which are not related to your ch=
anges:
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
        Issue: [rhel-10] workqueue: WQ_MEM_RECLAIM ttm:ttm_bo_delayed_delet=
e [ttm] is flushing !WQ_MEM_RECLAIM events:qxl_gc_work [qxl]
            URL: https://issues.redhat.com/browse/RHEL-35239
            Affected tests:
                Boot test [x86_64 (debug)]
                Reboot test [x86_64, x86_64 (debug)]
        Issue: kselftests: bpf:test_tunnel.sh [FAIL]
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1749
            Affected tests:
                kselftests upstream - bpf [x86_64 (debug)]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
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


Tests that were not ran because of internal issues:=20
    Memory function: memfd_create [aarch64, ppc64le, s390x, x86_64, x86_64 =
(debug)]


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

