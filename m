Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61951A3F
	for <llvm@lists.linux.dev>; Fri,  9 Dec 2022 10:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670580098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W0QKBreq9DKYp42w6tlCWalSzVhGDwlh1PBr9T9nlQ8=;
	b=CfjTuQfe4vhLes88VzaFQarsU6gmSdsgAxCH+F7LkkrXUSREDzQ5BTtmxhCTirsHY6aQvF
	VPvf/oRYnd9rPuhZHg193/ZwxaAMNo+i5sV+aO6b6RaUNe87ZYeTn858rjBFEiAHU4CXuw
	G+iDc6asutoBeeTmVEjwH74govAggDg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-8pEA0hCvPAutYTMBAbNDAg-1; Fri, 09 Dec 2022 05:01:37 -0500
X-MC-Unique: 8pEA0hCvPAutYTMBAbNDAg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBAF18027FE
	for <llvm@lists.linux.dev>; Fri,  9 Dec 2022 10:01:36 +0000 (UTC)
Received: from [172.64.11.46] (unknown [10.30.32.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 973A0492B04;
	Fri,  9 Dec 2022 10:01:31 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.1.0-rc8,
 mainline.kernel.org-clang, ce19275f)
Date: Fri, 09 Dec 2022 10:01:31 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Message-Id: <54390.122120905013700409@us-mta-311.us.mimecast.lan>
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
    Commit message: Merge tag 'for-linus-2022120801' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/hid/hid

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/62653

One or more kernel tests failed:
    =E2=9D=97 Regression(s) detected:
           s390x - selinux-policy: serge-testsuite
                   Issue: serge-testsuite: cap_userns/test ............. Du=
bious, test returned 1
                          https://gitlab.com/cki-project/kpet-db/-/issues/4=
5
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6310284

    Unrecognized or new issues:
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6309787

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] avc:  denied  { create } for  pid=3D60245 comm=3D"=
systemd-coredum" scontext=3Dsystem_u:system_r:systemd_coredump_t:s0 tcontex=
t=3Dsystem_u:system_r:systemd_coredump_t:s0 tclass=3Duser_namespace permiss=
ive=3D1
            URL: https://datawarehouse.cki-project.org/kcidb/tests/6300879
            Affected tests:
                 ppc64le - LTP: openposix test suite
                   s390x - LTP: openposix test suite
                  x86_64 - LTP: openposix test suite
                  x86_64 (debug) - LTP: openposix test suite
                  x86_64 (debug) - kselftests upstream - net
        Issue: CIFS Connectathon: ./test4: (/mnt/connectathon/kvm-06-guest1=
1.test) file.0 has mode 555 after chmod 0
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1456
            Affected tests:
                 ppc64le - CIFS Connectathon
                   s390x - CIFS Connectathon
                  x86_64 - CIFS Connectathon
                  x86_64 (debug) - CIFS Connectathon
        Issue: kselftests upstream - net: FAIL: tls.13_sm4_gcm.sendfile
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1479
            Affected tests:
                  x86_64 (debug) - kselftests upstream - net
        Issue: kselftests upstream: WARN: kselftests/tc-testing test not fo=
und in kselftest-list.txt
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1473
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: [rawhide] avc:  denied  { setpcap } for  pid=3D651 comm=3D"r=
syslogd" capability=3D8  scontext=3Dsystem_u:system_r:syslogd_t:s0 tcontext=
=3Dsystem_u:system_r:syslogd_t:s0 tclass=3Dcapability permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2149633
            Affected tests:
                 ppc64le - Reboot test
                   s390x - Reboot test
                  x86_64 - Reboot test
                  x86_64 (debug) - Reboot test
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: Storage block - storage fio numa: Performance comparison: mi=
n:40535 * 1.15 < max:81259
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032094
            Affected tests:
                  x86_64 - Storage - block - storage fio numa
        Issue: serge-testsuite: cap_userns/test ............. Dubious, test=
 returned 1
            URL: https://gitlab.com/cki-project/kpet-db/-/issues/45
            Affected tests:
                  x86_64 - selinux-policy: serge-testsuite
        Issue: stress: stress-ng - memory: stress-ng --memrate TIMEOUT
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1172
            Affected tests:
                   s390x - stress: stress-ng - memory
        Issue: stress: stress-ng - memory: system hit OOM
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1425
            Affected tests:
                   s390x - stress: stress-ng - memory
        Issue: stress: stress-ng - memory: (panic) Comm: systemd-oomd Not t=
ainted 6.1.0-rc3
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1461
            Affected tests:
                   s390x - stress: stress-ng - memory
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: [upstream] [aarch64] Boot Test: Error: kernel image argument=
 /boot/vmlinuz-6.1.0-rc8 not a file
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1497
            Affected tests:
                 aarch64 - Boot test



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

