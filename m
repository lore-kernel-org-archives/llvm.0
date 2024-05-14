Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D0419BDC
	for <llvm@lists.linux.dev>; Tue, 14 May 2024 05:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715666285; cv=none; b=VmBGJQQHhsQcLg/MtoOTyD3LhNvNqQ47v6GKJBIlYt0n9niHJ74ZSP1YueVFdgOFunmvAP+UHnZDClbd4/D7nYmJYPYJ9Zvg5K8xHtzxoOy8VzHHJMQg+YzrGbcOc5CmnbueLPl/2a3msVZiwgss7+IFe+VJkSyravvuffuWSh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715666285; c=relaxed/simple;
	bh=cp7QD50emPabLcjnOCUhpamixZCnScJ9uwfbbSLOujo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=MSVWawWMfWXczekSvUFIRGnbU5qHhuJDRupkf9hjVb1pDMeCo1D9/relR0lCDNW/TDZbAJTWzct24WXCC6AZGeTNPf7/NZPyTDRPLSHZiltCqDc5nEosaC4d1HsfFflrxRkUQ+bw2fk/WqNgvDP+IoQ9WG8M/c9itCbwbQMx3VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ct5K/jMl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ct5K/jMl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715666281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eqZTsKj2Sa6F0AiFaojMO3z9yGatygV37WLDTCYXjrE=;
	b=ct5K/jMlP5OJSTuPavLGBdbBqL/FNtAmzNCblxFUvFRPl/T4YZEjG3W5oXqsigngsCxCou
	+qi1DmiDAatcJDm/hQovEvqH8WIRG7mAtEFfyyCFq4AJU3t2MMvb1jyptBMar4gMByFO0I
	ZcNnqhd0z00sGCHc1+5VB+hw7CF3nFY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-H4tp-ZL1OzO9vTH0GY3cpg-1; Tue, 14 May 2024 01:51:40 -0400
X-MC-Unique: H4tp-ZL1OzO9vTH0GY3cpg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48D018030A5
	for <llvm@lists.linux.dev>; Tue, 14 May 2024 05:51:40 +0000 (UTC)
Received: from [172.64.11.15] (unknown [10.30.34.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD1BD1C00A8F;
	Tue, 14 May 2024 05:51:39 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 10 of 204): Test report for master
 (6.9.0, mainline.kernel.org-clang, f4e8d802)
Date: Tue, 14 May 2024 05:51:39 -0000
To: yiyan@redhat.com, bhe@redhat.com, fsuba@redhat.com, bgoncalv@redhat.com,
 llvm@lists.linux.dev, xzhou@redhat.com, xiawu@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Message-Id: <44235.124051401514000203@us-mta-81.us.mimecast.lan>
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
    Commit message: Merge tag 'vfs-6.10.rw' of git://git.kernel.org/pub/scm=
/linux/kernel/git/vfs/vfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1289113929

One or more kernel tests failed:
    Unrecognized or new issues:
        kdump - kexec-file-load
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1289113929-x86_64-kernel_upt_26
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /kdump/kexec-file-load
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1289113929-x86_64-kernel_upt_37
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        Storage - dm/common
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1289113929-ppc64le-kernel_upt_13
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL exit_code
        xfstests - cifsv3.11
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1289113929-x86_64-kernel_upt_52
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/001
                       =E2=9A=A1 ERROR /10_localwatchdog
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1289113929-x86_64-kernel-debug_upt_32
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic

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
                Boot test [s390x]
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
    machineinfo [ppc64le]
    Memory function: memfd_create [aarch64, ppc64le, s390x, x86_64, x86_64 =
(debug)]
    Reboot test [x86_64 (debug)]
    SELinux Custom Module Setup [ppc64le]


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

