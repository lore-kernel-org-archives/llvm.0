Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2F61C69D
	for <llvm@lists.linux.dev>; Wed, 31 Dec 2025 00:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767139944; cv=none; b=B4+PSO5GabJGpQp6oCZFJQ11PKuO1A81cGFmdG9CFkCc3NkhvGTyBpKUi/KzUTjMIvG+HhwtxIoybX8KXvfW8j+uHyORSZMtafdezc0xmJdIJU1Exz+BekjBqnntuU7FOOncS8gGVmk8ZmuJ3Oob9me+a4yR1RRcADDoCcLuuGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767139944; c=relaxed/simple;
	bh=GbNtvzuH4macgUVsoyT5dNMet9YIptuMl8eDesafE0I=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=PUL6k0jazX+lLlBoGTDfL5W3BRD92kcijsNl4zZY0Mq82PmiHKAKplayJZdm+UeF/5YeqAMz5AxdvFeLRo5VZk5FFxnl6uxBJXP0UPgobvsuec63UNDBNfUGE4eTiCmRQAogowEnxhR+uQ3MG3k/pB3/jCNko0/3nbY6DSB4v/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bLmnRABZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bLmnRABZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767139940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MLV68m3ACiuOCTGDrPirWQNVS0EhG0+wRIeSnMst9jw=;
	b=bLmnRABZgaLRbbR8r5dp3XzgOUT1de39im6bLecJF4upqCS4RMaRrT2qU3oVxuF/DO0SaU
	3/U20SYFGnPLaezQKydVR8MhucWMKIQO7Vl1Z7gnk5aELcWPxO/4ZjlNJThYS/LUGwyHb5
	lXQu97R1mQ/f51XbAQ+kkusXj/Lge0w=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-591-ftGb-I4oMxKlN5j7hBkIFw-1; Tue,
 30 Dec 2025 19:12:19 -0500
X-MC-Unique: ftGb-I4oMxKlN5j7hBkIFw-1
X-Mimecast-MFC-AGG-ID: ftGb-I4oMxKlN5j7hBkIFw_1767139938
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EB09A1956088
	for <llvm@lists.linux.dev>; Wed, 31 Dec 2025 00:12:17 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 43E05180045B;
	Wed, 31 Dec 2025 00:12:17 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.19.0-rc3,
 upstream-mainline, dbf8fe85)
Date: Wed, 31 Dec 2025 00:12:16 -0000
To: ftjahjad@redhat.com, llvm@lists.linux.dev, bgoncalv@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <94972.125123019121900159@us-mta-591.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mbCxLOJ8T9nwuCdBZsiMgVGICJn8t9RbHIZuc_yJ9vQ_1767139938
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'net-6.19-rc4' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2238409722

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2238409722_x86_64_kernel-debug_kcidb_tool_20323190_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2238409722_x86_64_kernel-debug_kcidb_tool_20323190_12
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: [RHEL10.0] blktests throtl failed
            URL: https://issues.redhat.com/browse/RHEL-66783
            Affected tests:
                Storage - blktests - throtl [s390x]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]
        Issue: avc: denied { getattr } for comm=3D"rpcbind" name=3D"/" dev=
=3D"pidfs" ino=3D1 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsys=
tem_u:object_r:pidfs_t:s0 tclass=3Dfilesystem permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417839
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]
        Issue: fedora rawhide - nfsv4.2 failed to update ctime when calling=
 futimens
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417851
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]
        Issue: [cki] [tests] unblocking setup-task failures (SELinux Custom=
 Module Setup|CKI/restraint|machineinfo|setup-nfsdump)
            URL: https://gitlab.com/cki-project/infrastructure/-/issues/777
            Affected tests:
                /test/misc/machineinfo [aarch64]
        Issue: [rawhide] [aarch64] avc:  denied  { open } for  pid=3D14791 =
comm=3D"systemd-user-ru" path=3D"/sys/kernel/mm/transparent_hugepage/enable=
d" dev=3D"sysfs" ino=3D1784 scontext=3Dsystem_u:system_r:systemd_user_runti=
medir_t:s0 tcontext=3Dsystem_u:object_r:sysfs_t:s0 tclass=3Dfile permissive=
=3D1
            URL: https://redhat-internal.slack.com/archives/C04EX425HP1/p17=
65900650445969
            Affected tests:
                /test/misc/machineinfo [aarch64]
                Boot test [aarch64]
                Reboot test [aarch64]
                Storage - blktests - ublk [aarch64]
                stress: stress-ng - cpu-cache [aarch64]
                xfstests - btrfs [aarch64]
                xfstests - ext4 [aarch64]
                xfstests - xfs [aarch64]



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

