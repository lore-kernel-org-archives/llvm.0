Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BFF13B5A1
	for <llvm@lists.linux.dev>; Fri, 10 May 2024 04:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715314230; cv=none; b=ZJ1xA3/3NItAeuN/fHn74nlNLFLHlTpcLtK4qlwJtlpoGH+0taxjKTayo8tLfgcc0IarZ1E+0ln714LJHAzHFOEwSqHXFpccwCxDdCzGF0cAvkhGTXOLnMzs8oiPkoBsnxsxXk57mhjM+/OjY3EEeq+zlqLLRadaDcynpDfsuu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715314230; c=relaxed/simple;
	bh=d2zxT7UFllFe6ZfFqF5AXdMRHdFiZGapgke1ZaxIYYU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Xg1jcl6sG8+pxPyvojDaZqVubHobyruNDrEwRZyO/ORofgprRGmLa3H5U98OEcDFZ8d6frqXQ8S/+N8KkbS48Aa1RaTEcXO9osfFfOyV8UBuGbjT6sAGae9Ut/dhcHukjjk83rB3BUtvhKofpouQIvCQcIFhyL+3DAj1XXOxBZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yibgk5+C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yibgk5+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715314227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UKYEZ1xiNM5Yl9G/pb14GR53wx1K71smSBsj7/hu72k=;
	b=Yibgk5+ClqEdg0c8Iqi7AmRbdR1waGj9mE8G2F21+MJlDIsDJUdzVqCIZGaby4LB0FJZsG
	i6JAKpJC3I6Iv2H/DZVssdsDb7RV5+bFvTEH6ve4Vaqguo2NS07dVNFaryTZp0I2WXb/B4
	45qAXUPYCPAkUPML3j9sbpoJndTX+s8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-7jhEDhhQMfaV0GYr3GhZIQ-1; Fri, 10 May 2024 00:10:24 -0400
X-MC-Unique: 7jhEDhhQMfaV0GYr3GhZIQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD88485A58C
	for <llvm@lists.linux.dev>; Fri, 10 May 2024 04:10:23 +0000 (UTC)
Received: from [172.64.13.41] (unknown [10.30.32.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B8662087D73;
	Fri, 10 May 2024 04:10:23 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 5 of 204): Test report for master
 (6.9.0-rc7, mainline.kernel.org-clang, 448b3fe5)
Date: Fri, 10 May 2024 04:10:23 -0000
To: bhe@redhat.com, llvm@lists.linux.dev, bgoncalv@redhat.com,
 yiyan@redhat.com, xiawu@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Message-Id: <11011.124051000102400149@us-mta-342.us.mimecast.lan>
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
    Commit message: Merge tag 'hwmon-for-v6.9-rc8' of git://git.kernel.org/=
pub/scm/linux/kernel/git/groeck/linux-staging

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1285024137

One or more kernel tests failed:
    Unrecognized or new issues:
        kdump - kexec-file-load
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1285024137-x86_64-kernel_upt_26
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /kdump/kexec-file-load
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1285024137-x86_64-kernel_upt_37
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

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
                Storage - blktests - blk - upstream [aarch64, s390x, x86_64=
]
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                stress: stress-ng - memory [aarch64, s390x, x86_64]
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

