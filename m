Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74197F7EF
	for <llvm@lists.linux.dev>; Mon,  6 May 2024 14:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715004391; cv=none; b=V8rNbiJ+exsCubVaZAv6Ru2AQzsnjUbgMF3Q0m5vjKb9aeNvdc47Nk1WTHKOajLdfh+OSwLpIhvJ4HqWlxz3ndyy0sW05xaVK1KEn7P48TaqUq3v/1euZ0f3vT1H/ZFDJNt/hmwjk3sUQ54xSyi5XSQ1Q76jENBOCx+OFNKDZoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715004391; c=relaxed/simple;
	bh=fMK4ms+0bwthy8r3mkOvLxfIz6BMa8y+yvFY8nUg8+o=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Hf8Jczh77LgQsA+WNOSSyYYtZuk83Z3kNm0pa0zBOYZ5hZCVAB02e2ELpmYIW0/6ll/0Hdkm8Y5K3KpUxHB/th4SF7n5VscOQhaUZBrV+fAYM9gl01oBNVNLNemmNejamz5l/sUhmaPb6TPY4Fb8t0cMd5LPf6uYYI0OchHR0qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jf5MdMiw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jf5MdMiw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715004388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wkQRRyLrU5Em46Fseuwrl3IfWoVQKukjs+QVBKj533I=;
	b=Jf5MdMiwRYcpKfa0IJpUsc9apzU2ktKJKDUvQBx8ajJ7Ui/1Zo6T9Oh4WTO4F/4DxuoBcR
	PIQLd63PRsZt4aSOSoBPlernGEAm8E1NDk1Yn2p4WZBWJHstKoSt5c1cYcl4vaAJtu/qn9
	/W4eI5noLarhZqtLe5QKfIzJl1lNM3U=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-449-bhlRIvC-PeStMSIBJ1PgdQ-1; Mon,
 06 May 2024 10:06:26 -0400
X-MC-Unique: bhlRIvC-PeStMSIBJ1PgdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D50F3C0F180
	for <llvm@lists.linux.dev>; Mon,  6 May 2024 14:06:26 +0000 (UTC)
Received: from [172.64.4.17] (unknown [10.30.33.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CBF52166AF5;
	Mon,  6 May 2024 14:06:26 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 5 of 204): Test report for master
 (6.9.0-rc6, mainline.kernel.org-clang, f462ae0e)
Date: Mon, 06 May 2024 14:06:26 -0000
To: bhe@redhat.com, xiawu@redhat.com, llvm@lists.linux.dev, yiyan@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Message-Id: <37169.124050610062602526@us-mta-449.us.mimecast.lan>
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
    Commit message: Merge tag 'edac_urgent_for_v6.9_rc7' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/ras/ras

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1279159493

One or more kernel tests failed:
    Unrecognized or new issues:
        kdump - kexec-file-load
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1279159493-x86_64-kernel_upt_26
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /kdump/kexec-file-load
        kdump - sysrq-c
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1279159493-aarch64-kernel_upt_31
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /kdump/kdump-sysrq-c

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

