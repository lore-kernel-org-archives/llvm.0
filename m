Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2965566E
	for <llvm@lists.linux.dev>; Sat, 25 Feb 2023 17:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677346901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6zFqwFLazcbsZ6D4TElvFBNTFM9p6SOHDx2WREV5iBY=;
	b=HlL8PF9TPKRlrHGxEniVo+vjbnmpdPtUtml9eDI0bJdqe0/f/HLsVxfmLZoSYR9fh+BMV0
	Z4t1d1RRD68iUcHz9BiQ2VBpVc2i+Dy+535uVgLHvmdMHO52F3EgVByQ6xcVM6Tt1yOYrm
	JvR0RYTqMRIUiD6kp4hdBuxz0kxKpbA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-ySrz_y4cP0-BRNIf3BaBqQ-1; Sat, 25 Feb 2023 12:41:40 -0500
X-MC-Unique: ySrz_y4cP0-BRNIf3BaBqQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A12602A5954D
	for <llvm@lists.linux.dev>; Sat, 25 Feb 2023 17:41:39 +0000 (UTC)
Received: from [172.64.14.61] (unknown [10.30.33.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86A181121314;
	Sat, 25 Feb 2023 17:41:39 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (105/381 SKIPPED): Test report for master
 (6.2.0, mainline.kernel.org-clang, 489fa31e)
Date: Sat, 25 Feb 2023 17:41:39 -0000
To: bgoncalv@redhat.com, llvm@lists.linux.dev, xzhou@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Message-Id: <35688.123022512414000107@us-mta-63.us.mimecast.lan>
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
    Commit message: Merge branch 'work.misc' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/viro/vfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/74148

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7261558
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7262109
          x86_64 (debug) - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7262113
          x86_64 (debug) - xfstests - ext4
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7262158
          x86_64 (debug) - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7262163

    We also see the following known issues which are not related to your ch=
anges:
        Issue: CIFS Connectathon: SELinux prevents mount.cifs, request-key =
and cifs.idmap
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1525
            Affected tests:
                 ppc64le - CIFS Connectathon
                   s390x - CIFS Connectathon
                  x86_64 - CIFS Connectathon
                  x86_64 (debug) - CIFS Connectathon
        Issue: Usex - version 1.9-29: FATAL ERROR: zipinfo returned exit st=
atus: 3
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1543
            Affected tests:
                  x86_64 - Usex - version 1.9-29
                  x86_64 (debug) - Usex - version 1.9-29
        Issue: kselftests upstream - net: FAIL: Ping received ICMP Packet t=
oo big
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1571
            Affected tests:
                  x86_64 (debug) - kselftests upstream - net
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: Storage nvme - rdma: nvme/014 - flush: Interrupted system ca=
ll
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1980181
            Affected tests:
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: stress: stress-ng - memory: SELinux prevents pipefs
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1541
            Affected tests:
                   s390x - stress: stress-ng - memory
        Issue: stress: stress-ng - memory: stress-ng invoked oom-killer: gf=
p_mask=3D0x140dca(GFP_HIGHUSER_MOVABLE|__GFP_COMP|__GFP_ZERO), order=3D0, o=
om_score_adj=3D1000
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1214
            Affected tests:
                   s390x - stress: stress-ng - memory
        Issue: stress: stress-ng - memory: system hit OOM
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1425
            Affected tests:
                   s390x - stress: stress-ng - memory
        Issue: kdump - sysrq-c: kdump: Reserved 0MB memory for crash kernel
            URL: https://datawarehouse.cki-project.org/kcidb/tests/7188004
            Affected tests:
                   s390x - kdump - sysrq-c
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite



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

