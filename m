Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170141847
	for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 06:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693378289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GsS8ve+GrpW6UYk8RXBbwWY7iMlVNH1xbLUXJQnVoyc=;
	b=O+e745q+cAZceyUwOzLWxGmNsUjqKAJe0iQyDhxGbvHu8IaosF7jcHKNbfgw3jA/knkxQm
	w0cwuJqUGA0k7Pi/BUjK8cox9tOAZYMNcsD7gmQPRWAXBxo1014PEk9uOIXsQn9TKSIgiI
	I7CdS8AsHEgc+Lv0V2BsjO+AlT4eHZs=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-jXLPtEvrMuO1zyJFtNGX5w-1; Wed, 30 Aug 2023 02:51:28 -0400
X-MC-Unique: jXLPtEvrMuO1zyJFtNGX5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 396F33827DEC
	for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 06:51:28 +0000 (UTC)
Received: from [172.64.14.60] (unknown [10.30.33.250])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1816B40C2063;
	Wed, 30 Aug 2023 06:51:28 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (SKIPPED 6 of 271): Test report for master
 (6.5.0, mainline.kernel.org-clang, 651a00bc)
Date: Wed, 30 Aug 2023 06:51:28 -0000
To: haliu@redhat.com, czhong@redhat.com, yinxu@redhat.com,
 llvm@lists.linux.dev, jiji@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Message-Id: <77811.123083002512800329@us-mta-503.us.mimecast.lan>
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
    Commit message: Merge tag 'slab-for-6.6' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/vbabka/slab

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/102093

One or more kernel tests failed:
    Unrecognized or new issues:
         aarch64 - Storage - swraid scsi_raid
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9324868
                   Non-passing subtests:
                       =E2=9D=8C FAIL Test
         aarch64 - Networking sctp-auth: sockopts test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9324886
                   Non-passing subtests:
                       =E2=9D=8C FAIL Setup
         ppc64le - Networking sctp-auth: sockopts test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9325062
                   Non-passing subtests:
                       =E2=9D=8C FAIL Setup
           s390x - Networking sctp-auth: sockopts test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9325025
                   Non-passing subtests:
                       =E2=9D=8C FAIL Setup
          x86_64 - Networking sctp-auth: sockopts test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9325116
                   Non-passing subtests:
                       =E2=9D=8C FAIL Setup
          x86_64 (debug) - Networking sctp-auth: sockopts test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9325179
                   Non-passing subtests:
                       =E2=9D=8C FAIL Setup

    We also see the following known issues which are not related to your ch=
anges:
        Issue: Storage - blktests - nvme-tcp: hit test timeout
            URL: https://datawarehouse.cki-project.org/kcidb/tests/7523235
            Affected tests:
                 aarch64 - Storage - blktests - nvme-tcp
        Issue: stress: stress-ng - memory: stress-ng --mcontend 0 TIMEOUT
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1185
            Affected tests:
                 aarch64 - stress: stress-ng - memory
        Issue: kdump - kexec_boot: image_arm64_probe: Bad arm64 image heade=
r
            URL: https://issues.redhat.com/browse/RHELPLAN-138156
            Affected tests:
                 aarch64 - kdump - kexec_boot
                 aarch64 - kdump - kexec-file-load
        Issue: kdump - sysrq-c: (panic) dump_backtrace+0xe8/0x140
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1561
            Affected tests:
                 aarch64 - kdump - sysrq-c
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
        Issue: kdump - sysrq-c: kdump: Reserved 0MB memory for crash kernel
            URL: https://datawarehouse.cki-project.org/kcidb/tests/7188004
            Affected tests:
                   s390x - kdump - sysrq-c
        Issue: Storage - lvm thinp sanity: FAIL: mkfs.xfs -fd noalign /dev/=
mapper/myvg-thinvolume1
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1353
            Affected tests:
                 ppc64le - Storage - lvm thinp sanity
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
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
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

