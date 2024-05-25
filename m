Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4DA8F66
	for <llvm@lists.linux.dev>; Sat, 25 May 2024 05:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716613852; cv=none; b=ddpmaqo0BnBhoZ+npAlqO4c1hSXl3UyTiVvXm6cyv2ywTHmLbopJ+rqf48VGxPK0XxHyU1MhK8RQCZRdLlputn3mmytn7/jCn5RgAQ6DjpopAWS1NLeTNpHVMqIP3R9uNWskeI/NUXi7spuUWCKUqQlHmJ8m13rN8CTVvqRHRhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716613852; c=relaxed/simple;
	bh=Lj+Uo495KwrPHv5uskf3aJMpslC4Gc97d7KiyThIMj0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=O2KyUC2fzN0QihrKAJF7sHEU6cZyolFPFbpI6E93AkW91FN2tjuRKIHM1Jf3k58DGHyyRfMYSO/mGqzkc6ITRY4G+3RabNCiKYHs2FmvNjN3CFB/ccCTqBa/3OxG6oCEoB9FmhmBax3Fz9rGX0dvZDaRq4Is2mwb6fncPcPlEN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TsnXHsuN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TsnXHsuN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716613849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/FBivmLbdBfJaQS4quN4qShQe00+kxcnBrHKD0WVrz0=;
	b=TsnXHsuNnVGCzFtY0ytWejcZ8R6T6A49LpwOZKe+ssmVuExpxODDDUdraKXpJXs4p9MoNI
	SDg5quJ/G89h9uCnIoBIgZyv+IFSfPfwCTSl/PwRH5O+FC1QtYYS6UaIIJY7recSbSUlXv
	4cQYE+9/17maKLrFty9Izd5YAYrXXEs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-qarpc782Pq688ezVSswwvA-1; Sat, 25 May 2024 01:10:48 -0400
X-MC-Unique: qarpc782Pq688ezVSswwvA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E459185A780
	for <llvm@lists.linux.dev>; Sat, 25 May 2024 05:10:48 +0000 (UTC)
Received: from [172.64.0.115] (unknown [10.30.33.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 95A4E7412;
	Sat, 25 May 2024 05:10:47 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 25 of 204): Test report for master
 (6.9.0, mainline.kernel.org-clang, 02c438bb)
Date: Sat, 25 May 2024 05:10:47 -0000
To: jishi@redhat.com, haliu@redhat.com, llvm@lists.linux.dev, yiche@redhat.com,
 zlang@redhat.com, jiji@redhat.com, xzhou@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Message-Id: <96299.124052501104800179@us-mta-102.us.mimecast.lan>
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
    Commit message: Merge tag 'for-6.10-tag' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/kdave/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1304424277

One or more kernel tests failed:
    Unrecognized or new issues:
        Networking cki netfilter test
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1304424277-ppc64le-kernel_upt_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Networking vnic: ipvlan/basic
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1304424277-ppc64le-kernel_upt_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        POSIX pjd-fstest suites
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1304424277-ppc64le-kernel_upt_5
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        xfstests - cifsv3.11
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1304424277-x86_64-kernel_upt_52
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/590
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1304424277-x86_64-kernel-debug_upt_32
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/014

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
                Storage - blktests - blk - upstream [x86_64]
                stress: stress-ng - cpu-cache [x86_64]
                stress: stress-ng - memory [x86_64]
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
    Boot test [aarch64, s390x]
    CKI/restraint [aarch64, s390x]
    kselftests upstream - bpf [x86_64 (debug)]
    kselftests upstream - bpf_test_progs [x86_64 (debug)]
    kselftests upstream - net [x86_64 (debug)]
    machineinfo [aarch64, s390x]
    Reboot test [aarch64, s390x, x86_64 (debug)]
    SELinux Custom Module Setup [aarch64, s390x, x86_64 (debug)]
    Storage - blktests - blk - upstream [aarch64, s390x]
    Storage - blktests - nvme-tcp - upstream [aarch64, s390x]
    Storage - swraid scsi_raid [aarch64, s390x]
    stress: stress-ng - cpu-cache [aarch64, s390x]
    stress: stress-ng - memory [aarch64, s390x]


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

