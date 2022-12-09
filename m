Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6A22F3D
	for <llvm@lists.linux.dev>; Fri,  9 Dec 2022 15:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670600493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=acfFcJPIFVO1708W8F1TFiE2sXKqjtNH164v4UwDDas=;
	b=CFLH3fT09PfpLrW0A5idLyK8hAPaQQzmN5sdzGtEPGXuiDbZLHPzihz8D+JBWqjQst1NLR
	nBuphnxC+7vwGbh36q42CukMxFCOCbmzMpqulcvhtWxEsHE9XPJ8LgjpxMpKycy808H/8e
	uEgJTSne/UL2/AqLMot6fLj041eEQ0Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-Qq6N922XPva3epRqUPdkNw-1; Fri, 09 Dec 2022 10:41:31 -0500
X-MC-Unique: Qq6N922XPva3epRqUPdkNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C711185A79C
	for <llvm@lists.linux.dev>; Fri,  9 Dec 2022 15:41:31 +0000 (UTC)
Received: from [172.64.11.46] (unknown [10.30.32.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 34B9E1121331;
	Fri,  9 Dec 2022 15:41:31 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.1.0-rc8,
 mainline.kernel.org-clang, 0d1409e4)
Date: Fri, 09 Dec 2022 15:41:31 -0000
To: llvm@lists.linux.dev, xzhou@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Message-Id: <69446.122120910413103351@us-mta-262.us.mimecast.lan>
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
    Commit message: Merge tag 'drm-fixes-2022-12-09' of git://anongit.freed=
esktop.org/drm/drm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/62671

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 - xfstests - nfsv4.2
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6314482
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6314139
          x86_64 (debug) - xfstests - nfsv4.2
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6314199

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] avc:  denied  { create } for  pid=3D60245 comm=3D"=
systemd-coredum" scontext=3Dsystem_u:system_r:systemd_coredump_t:s0 tcontex=
t=3Dsystem_u:system_r:systemd_coredump_t:s0 tclass=3Duser_namespace permiss=
ive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2152137
            Affected tests:
                 ppc64le - LTP: openposix test suite
                   s390x - LTP: openposix test suite
                  x86_64 - LTP: openposix test suite
                  x86_64 (debug) - LTP: openposix test suite
        Issue: CIFS Connectathon: ./test4: (/mnt/connectathon/kvm-06-guest1=
1.test) file.0 has mode 555 after chmod 0
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1456
            Affected tests:
                 ppc64le - CIFS Connectathon
                   s390x - CIFS Connectathon
                  x86_64 - CIFS Connectathon
                  x86_64 (debug) - CIFS Connectathon
        Issue: Networking socket: fuzz: ./service.sh: line 74: [: %rhel: in=
teger expression expected
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1455
            Affected tests:
                  x86_64 (debug) - Networking socket: fuzz
        Issue: Networking socket: fuzz: hit test timeout
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1449
            Affected tests:
                  x86_64 (debug) - Networking socket: fuzz
        Issue: [rawhide] avc:  denied  { setpcap } for  pid=3D651 comm=3D"r=
syslogd" capability=3D8  scontext=3Dsystem_u:system_r:syslogd_t:s0 tcontext=
=3Dsystem_u:system_r:syslogd_t:s0 tclass=3Dcapability permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2149633
            Affected tests:
                 ppc64le - Reboot test
                   s390x - Reboot test
                  x86_64 - Reboot test
                  x86_64 (debug) - Networking sctp-auth: sockopts test
                  x86_64 (debug) - Reboot test
        Issue: kselftests upstream: WARN: kselftests/tc-testing test not fo=
und in kselftest-list.txt
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1473
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: Storage block - storage fio numa: Performance comparison: mi=
n:40535 * 1.15 < max:81259
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032094
            Affected tests:
                  x86_64 - Storage - block - storage fio numa
        Issue: serge-testsuite: cap_userns/test ............. Dubious, test=
 returned 1
            URL: https://gitlab.com/cki-project/kpet-db/-/issues/45
            Affected tests:
                   s390x - selinux-policy: serge-testsuite
                  x86_64 - selinux-policy: serge-testsuite
        Issue: Storage blktests - blk: scsi/007: Reading from scsi_debug fa=
iled
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2027550
            Affected tests:
                   s390x - Storage - blktests - blk
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

