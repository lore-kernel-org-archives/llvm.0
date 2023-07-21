Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE15127F3F
	for <llvm@lists.linux.dev>; Fri, 21 Jul 2023 15:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689954680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tZl7Q8/de1Iyje6vic5Qq3Hvp19YjAygoQnFGwBYMoU=;
	b=eyVYOqce7LyUuo0QGvG5GSZQgodE83AaPsCs1Wa1bRpncEHabnUCqTzEe8Y5oAIt8tCQHk
	pnRN6QCLM4oRoDy5wZC9xzaLEzr3ZL1PoVlEG3OH618Y4djs+o+9CVPbXounzZrHyG6JfB
	1oGUVsSqjXDZRPMdclxVPQ4JAjPEskk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-ortdM7ccOwOJwu78GoDOTA-1; Fri, 21 Jul 2023 11:51:19 -0400
X-MC-Unique: ortdM7ccOwOJwu78GoDOTA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC5E5800C7F
	for <llvm@lists.linux.dev>; Fri, 21 Jul 2023 15:51:18 +0000 (UTC)
Received: from [172.64.4.102] (unknown [10.30.32.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B622AC585A0;
	Fri, 21 Jul 2023 15:51:18 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (SKIPPED 22 of 328): Test report for master
 (6.5.0-rc2, mainline.kernel.org-clang, f7e3a1ba)
Date: Fri, 21 Jul 2023 15:51:18 -0000
To: llvm@lists.linux.dev, bgoncalv@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Message-Id: <79572.123072111511900511@us-mta-90.us.mimecast.lan>
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
    Commit message: Merge tag 'drm-fixes-2023-07-21' of git://anongit.freed=
esktop.org/drm/drm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/96733

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8845597
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8845640

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [Rawhide] kdump - kexec_boot: [ ERROR ] :: Kexec boot failed=
. Expect to see newkerneloption in kernel boot options
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2057391
            Affected tests:
                  x86_64 - kdump - kexec-file-load
        Issue: kdump - kexec-file-load: Kexec boot failed as fileloadoption=
 is not seen in kernel boot options
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1433
            Affected tests:
                  x86_64 - kdump - kexec-file-load
        Issue: [upstream] unchecked MSR access error: RDMSR from 0xe2 at rI=
P: 0xffffffff87090227 (native_read_msr+0x7/0x40) (intel_idle_init_cstates_i=
cpu)
            URL: https://lore.kernel.org/all/CA+QYu4qSBdhEgFURu+ouAf2d_JNPb=
ZgCSUaxCLoGzMqDQOLWsQ@mail.gmail.com/
            Affected tests:
                  x86_64 - Boot test
                  x86_64 - Reboot test
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
        Issue: Storage - lvm thinp sanity: FAIL: mkfs.xfs -fd noalign /dev/=
mapper/myvg-thinvolume1
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1353
            Affected tests:
                 ppc64le - Storage - lvm thinp sanity
        Issue: Kdump saving vmcore failed: open_dump_memory: Can't open the=
 dump memory(/proc/vmcore). No such file or directory
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2222526
            Affected tests:
                 ppc64le - kdump - sysrq-c
                 ppc64le - kdump - file-load
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: kdump - kexec_boot: image_arm64_probe: Bad arm64 image heade=
r
            URL: https://issues.redhat.com/browse/RHELPLAN-138156
            Affected tests:
                 aarch64 - kdump - kexec_boot
                 aarch64 - kdump - kexec-file-load
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
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

