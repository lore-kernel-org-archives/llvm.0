Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FC78C10
	for <llvm@lists.linux.dev>; Sat, 21 Oct 2023 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fXq51vON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697881876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GntzjHQaQL//FC7g4gKbhfKnzQv+hjj5rtDHcOJia6k=;
	b=fXq51vONE6DPwoBOIKFYKH3tdFd8oI/7YuOjmN8kNMZ6sxaHoP9+Ezs93Vp/+gvdIr32xw
	Xn7ptnesSLhbQf2fS/5diCD6Cfv0JHaH9V4LQKHvGCz4gm65620i0LeiPSetBB+eKn9dQF
	EtXlu48A1hZ4RWiWbRbt7r8wMw/eV5s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-MeS-gGM8Nt-Hup0kwXVXsA-1; Sat, 21 Oct 2023 05:51:15 -0400
X-MC-Unique: MeS-gGM8Nt-Hup0kwXVXsA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C5CB8C7EC0
	for <llvm@lists.linux.dev>; Sat, 21 Oct 2023 09:51:15 +0000 (UTC)
Received: from [172.64.4.17] (unknown [10.30.33.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DFDE41C060AE;
	Sat, 21 Oct 2023 09:51:14 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 15 of 230): Test report for master
 (6.6.0-rc6, mainline.kernel.org-clang, 9c5d00cb)
Date: Sat, 21 Oct 2023 09:51:14 -0000
To: llvm@lists.linux.dev, czhong@redhat.com, jbastian@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Message-Id: <18171.123102105511500287@us-mta-327.us.mimecast.lan>
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
    Commit message: Merge tag 'perf-tools-fixes-for-v6.6-2-2023-10-20' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/110427

One or more kernel tests failed:
    Unrecognized or new issues:
         aarch64 - stress: stress-ng - memory
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10009059
                   Non-passing subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - stress: stress-ng - memory
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10009173
                   Non-passing subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 (debug) - Storage - swraid scsi_raid
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10009015
                   Non-passing subtests:
                       =E2=9D=8C FAIL Test
                       =E2=9D=8C FAIL /01_dmesg_check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: use after free in reweight_entity
            URL: https://lkml.iu.edu/hypermail/linux/kernel/2310.2/00187.ht=
ml
            Affected tests:
                  x86_64 (debug) - xfstests - ext4
        Issue: xfstests generic/245: cannot overwrite File exists
            URL: https://www.spinics.net/lists/fstests/msg23667.html
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                  x86_64 (debug) - xfstests - nfsv4.2



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

