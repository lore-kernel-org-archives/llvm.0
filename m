Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B32A21
	for <llvm@lists.linux.dev>; Sun,  2 Jun 2024 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717323678; cv=none; b=sMYWy0M0IfJVie19qEIJBmJQyiOjEA1GEeJK40qF3ksiGHg9TZ3KVf5+EaAlT2L/tbVUt1e20bTGRc4ihO02B1wfir/AL4bNdXDDuLOb2/n0DbBIIvnFFPdNS/d6+wWMjpDP/xYo1lZ1Tyu8j7Yxbvb9J1TH7sXs+ct6ch5lhjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717323678; c=relaxed/simple;
	bh=BL51VA467JF7GyLk+j6G6TjgQ1mIF9zhiAF+KwK5LwI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Q3Bx1VD6JQMKO089cd9SJdkrU3WJybbOYxxNFc8gdZMIQNIcuvEnP7wj0PuraKx9Bpi1lQzr6DX5H+JxGwsi1Iuq1towWNN9EkZJthaiocK6iMiJXmKeCepN2IWiF4UeZHGvd2djx/DjZKGv+8VPAflZJV8aDuEzQE7rn6U3A00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G9BuasiS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G9BuasiS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717323675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D5SyPhJdM/mhxkKJzISKomFBHWQ0xZBpL0v5VMdMEZA=;
	b=G9BuasiS8+VdxBmVxDOuJtvHCPhbUOpeFuozpoyQUQ3Jq1m6lCTSXLF22xwE3BHnIZ6qbN
	2nx73ztvDWpkHhDhuAJC9veWDHXUM66J6+6c9fdpB/ncRl3BlHl9KUc05kEMIDYHj7TaXH
	HdfjRQdB1W/dI4JI1t9Q6i1xkEZSMnM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-36-_aBjMBseOXScTypWGa8p4Q-1; Sun,
 02 Jun 2024 06:21:12 -0400
X-MC-Unique: _aBjMBseOXScTypWGa8p4Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0978B1C05129;
	Sun,  2 Jun 2024 10:21:12 +0000 (UTC)
Received: from [172.64.13.36] (unknown [10.30.32.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 81D2A40C123D;
	Sun,  2 Jun 2024 10:21:11 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 11 of 192): Test report for master
 (6.10.0-rc1, mainline.kernel.org-clang, ec9eeb89)
Date: Sun, 02 Jun 2024 10:21:11 -0000
To: jbastian@redhat.com, shinichiro.kawasaki@wdc.com, yiche@redhat.com,
 jiji@redhat.com, zlang@redhat.com, yizhan@redhat.com, bgoncalv@redhat.com,
 jishi@redhat.com, haliu@redhat.com, llvm@lists.linux.dev, xzhou@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Message-Id: <85844.124060206211200283@us-mta-36.us.mimecast.lan>
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
    Commit message: Merge tag 'kbuild-fixes-v6.10' of git://git.kernel.org/=
pub/scm/linux/kernel/git/masahiroy/linux-kbuild

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1314510789

One or more kernel tests failed:
    Unrecognized or new issues:
        Networking cki netfilter test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1314510789-aarch64-kernel_upt_20
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1314510789-x86_64-kernel_upt_20
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Networking vnic: ipvlan/basic
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1314510789-aarch64-kernel_upt_21
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1314510789-x86_64-kernel_upt_21
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        POSIX pjd-fstest suites
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1314510789-aarch64-kernel_upt_15
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1314510789-x86_64-kernel_upt_15
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1314510789-x86_64-kernel_upt_35
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        Storage - blktests - blk - upstream
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1314510789-aarch64-kernel_upt_5
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        stress: stress-ng - cpu-cache
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1314510789-aarch64-kernel_upt_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
        stress: stress-ng - memory
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1314510789-aarch64-kernel_upt_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1314510789-aarch64-kernel_upt_39
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1314510789-x86_64-kernel_upt_48
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        xfstests - cifsv3.11
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1314510789-x86_64-kernel-debug_upt_32
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/207
                       =E2=9D=8C FAIL generic/208
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1314510789-x86_64-kernel_upt_50
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/207
                       =E2=9D=8C FAIL generic/208
        xfstests - ext4
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1314510789-aarch64-kernel_upt_37
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1314510789-x86_64-kernel_upt_46
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
        xfstests - xfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1314510789-aarch64-kernel_upt_38
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1314510789-x86_64-kernel_upt_47
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] avc:  denied  { ioctl } for  pid=3D326068 comm=3D"=
systemd-coredum" path=3D"/dev/z90crypt" dev=3D"devtmpfs" ino=3D99 ioctlcmd=
=3D0x7a05 scontext=3Dsystem_u:system_r:systemd_coredump_t:s0 tcontext=3Dsys=
tem_u:object_r:crypt_device_t:s0 tclass=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2283367
            Affected tests:
                Boot test [s390x]
        Issue: [eln] avc:  denied  { create } for  pid=3D1 comm=3D"systemd"=
 scontext=3Dsystem_u:system_r:init_t:s0 tcontext=3Dsystem_u:system_r:sshd_t=
:s0-s0:c0.c1023 tclass=3Dvsock_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2280320
            Affected tests:
                Boot test [ppc64le]
                Reboot test [ppc64le]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:=20
    Boot test [s390x]
    CKI/restraint [s390x]
    machineinfo [s390x]
    Reboot test [s390x]
    SELinux Custom Module Setup [ppc64le, s390x]
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

