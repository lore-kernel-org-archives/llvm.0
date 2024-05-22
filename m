Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89A87A715
	for <llvm@lists.linux.dev>; Wed, 22 May 2024 10:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716375116; cv=none; b=ua43loycnSBSeoaqp3pNGES2SVGmneMx51Gr4mGwDaUn7lMq0aCZNAqeXa/U47tLLI4iiObAhXTAeBnkrZ0/bSPdqimfBW/R1j9xUsNMh7Drf42X1RwvFjoO5JeDS5eUOUc2G4MIEovJF8PE0HVhTqrf5XKy1oUxqfxEKoeohoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716375116; c=relaxed/simple;
	bh=B3B1X4iuE2xYw3dEflEj72nu4RB/wBNRoPFnFAY73y4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=TXKpy8CCgSW14IbzOyEDRtpA/gU4M2yd+YTpgOr4JhXjoHu5VbP1FbmMNGiOMA91ZWLv7kB5puPjR4F4bVak0QOGlF6Q9rIJAwHyPXuyKrvaD/qxLJ5XjBmy5tQVSQj5H2PMjpmfoLF7th5BjS/tk5cWqRpMyT/YjNg+itz3IGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gVTHtpjq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gVTHtpjq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716375113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v7tP59m4y9ZdXJrG3dSiOW5wLwcpI/5+Uo/Q+fpDb30=;
	b=gVTHtpjq/4w91FCzX8lBSnI2hOAPsA5ycbOO/UaZtMQKVAi2OAGAGfE18SZH1Q5TGhPI4i
	FrTWvtny5rOr0QXY5rF0Yn+bNp9w2xrW0r5cnRiRtf9eb+DyJpDsWoQ62fpUYiJeTVVNHq
	+VMC9FHBFSZ5AndH60RqsMsoZ2YB5yM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-VlRoEUdDPVyUayp-hwk8Iw-1; Wed, 22 May 2024 06:51:52 -0400
X-MC-Unique: VlRoEUdDPVyUayp-hwk8Iw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E733A801780
	for <llvm@lists.linux.dev>; Wed, 22 May 2024 10:51:51 +0000 (UTC)
Received: from [172.64.11.21] (unknown [10.30.34.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D9AD3C27;
	Wed, 22 May 2024 10:51:51 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 10 of 204): Test report for master
 (6.9.0, mainline.kernel.org-clang, b9dd56e8)
Date: Wed, 22 May 2024 10:51:51 -0000
To: jishi@redhat.com, zlang@redhat.com, haliu@redhat.com, yiche@redhat.com,
 jiji@redhat.com, bgoncalv@redhat.com, llvm@lists.linux.dev, xzhou@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Message-Id: <19398.124052206515200318@us-mta-586.us.mimecast.lan>
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
    Commit message: Merge tag 'soundwire-6.10-rc1' of git://git.kernel.org/=
pub/scm/linux/kernel/git/vkoul/soundwire

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1299678693

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1299678693-x86_64-kernel-debug_upt_4
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Networking cki netfilter test
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1299678693-ppc64le-kernel_upt_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Networking vnic: ipvlan/basic
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1299678693-ppc64le-kernel_upt_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        POSIX pjd-fstest suites
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1299678693-ppc64le-kernel_upt_5
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Reboot test
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1299678693-x86_64-kernel-debug_upt_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        xfstests - cifsv3.11
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1299678693-x86_64-kernel_upt_52
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/590
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1299678693-x86_64-kernel-debug_upt_32
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/590

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] SELinux is preventing systemd-userdbd from map_rea=
d, map_write access on the bpf labeled init_t.
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2250930
            Affected tests:
                Hardware - Firmware test suite [aarch64]
                Networking cki netfilter test [aarch64, s390x, x86_64]
                Networking vnic: ipvlan/basic [aarch64, s390x, x86_64]
                POSIX pjd-fstest suites [aarch64, s390x, x86_64]
                Storage - blktests - blk - upstream [aarch64, x86_64]
                stress: stress-ng - cpu-cache [aarch64, x86_64]
                stress: stress-ng - memory [aarch64, x86_64]
                xfstests - btrfs [aarch64, x86_64]
                xfstests - ext4 [aarch64, x86_64]
                xfstests - xfs [aarch64, x86_64]
        Issue: [eln] avc:  denied  { create } for  pid=3D1 comm=3D"systemd"=
 scontext=3Dsystem_u:system_r:init_t:s0 tcontext=3Dsystem_u:system_r:sshd_t=
:s0-s0:c0.c1023 tclass=3Dvsock_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2280320
            Affected tests:
                Boot test [aarch64, ppc64le, s390x, x86_64]
                Reboot test [aarch64, ppc64le, s390x, x86_64]
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
                Networking cki netfilter test [s390x]
                Networking vnic: ipvlan/basic [s390x]
                POSIX pjd-fstest suites [s390x]


Tests that were not ran because of internal issues:=20
    Boot test [s390x]
    CKI/restraint [s390x]
    machineinfo [s390x]
    Reboot test [s390x]
    SELinux Custom Module Setup [s390x]
    Storage - blktests - blk - upstream [s390x]
    Storage - blktests - nvme-tcp - upstream [s390x]
    Storage - swraid scsi_raid [s390x]
    stress: stress-ng - cpu-cache [s390x]
    stress: stress-ng - memory [s390x]


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

