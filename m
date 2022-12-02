Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335891C26
	for <llvm@lists.linux.dev>; Fri,  2 Dec 2022 22:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670020299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qXkFx/TsuofqCm+FWp+1OtKhI2bAXFjNShDyU4HyAl0=;
	b=bqTAbA7h9z2n9/hO09cD8rcmBqUDl7LwJvRfUUvW6AHpu2LA9QLexs0Tp47ufj+XneM/Vl
	IGotQZqdmqdYGApMGzr4jXRuc9Eb9/bbJGDuynoItJMQlzedZ9HoCcF3kDAlE+by0gQIii
	1jj5WVgqGbYKXYkZ46pGKA1LkSbCIxo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-aDF4y2phO5SSp81yRCaWkQ-1; Fri, 02 Dec 2022 17:31:38 -0500
X-MC-Unique: aDF4y2phO5SSp81yRCaWkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A648185A78F
	for <llvm@lists.linux.dev>; Fri,  2 Dec 2022 22:31:38 +0000 (UTC)
Received: from [172.64.5.14] (unknown [10.30.33.126])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 26ECC40E9785;
	Fri,  2 Dec 2022 22:31:38 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.1.0-rc7,
 mainline.kernel.org-clang, a4412fdd)
Date: Fri, 02 Dec 2022 22:31:38 -0000
To: llvm@lists.linux.dev, bgoncalv@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Message-Id: <52394.122120217313800489@us-mta-341.us.mimecast.lan>
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
    Commit message: error-injection: Add prompt for function error injectio=
n

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/61846

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6194245
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6194354

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { sys_admin } for  pid=3D674004 comm=3D"system=
d-gpt-aut" capability=3D21  scontext=3Dsystem_u:system_r:systemd_gpt_genera=
tor_t:s0 tcontext=3Dsystem_u:system_r:systemd_gpt_generator_t:s0 tclass=3Dc=
apability permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2083900
            Affected tests:
                 aarch64 - Networking MACsec: sanity
                 aarch64 - Networking cki netfilter test
                 aarch64 - ALSA PCM loopback test
                 aarch64 - Storage - SCSI VPD
                 ppc64le - Networking MACsec: sanity
                 ppc64le - Networking cki netfilter test
                 ppc64le - ALSA PCM loopback test
                   s390x - Networking MACsec: sanity
                   s390x - Networking cki netfilter test
                  x86_64 - Networking MACsec: sanity
                  x86_64 - Networking cki netfilter test
                  x86_64 - ALSA PCM loopback test
                  x86_64 - Storage - SCSI VPD
                  x86_64 (debug) - Networking cki netfilter test
                  x86_64 (debug) - Storage - SCSI VPD
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
                  x86_64 (debug) - kselftests upstream - forwarding
                  x86_64 (debug) - kselftests upstream - tc
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: [rawhide] avc:  denied  { setpcap } for  pid=3D651 comm=3D"r=
syslogd" capability=3D8  scontext=3Dsystem_u:system_r:syslogd_t:s0 tcontext=
=3Dsystem_u:system_r:syslogd_t:s0 tclass=3Dcapability permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2149633
            Affected tests:
                 aarch64 - Reboot test
                 ppc64le - Reboot test
                   s390x - Reboot test
                  x86_64 - Reboot test
                  x86_64 (debug) - Reboot test
        Issue: Storage blktests - blk: scsi/007: Reading from scsi_debug fa=
iled
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2027550
            Affected tests:
                   s390x - Storage - blktests - blk
                  x86_64 - Storage - blktests - blk
        Issue: Storage block - storage fio numa: Performance comparison: mi=
n:40535 * 1.15 < max:81259
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032094
            Affected tests:
                 aarch64 - Storage - block - storage fio numa
                  x86_64 - Storage - block - storage fio numa
        Issue: Networking MACsec: sanity: Cannot find device "dummy0"
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1306
            Affected tests:
                 aarch64 - Networking MACsec: sanity
                 ppc64le - Networking MACsec: sanity
                   s390x - Networking MACsec: sanity
                  x86_64 - Networking MACsec: sanity
        Issue: Networking route: pmtu: Cannot find device "veth0_client"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2118519
            Affected tests:
                 aarch64 - Networking MACsec: sanity
                 ppc64le - Networking MACsec: sanity
                   s390x - Networking MACsec: sanity
                  x86_64 - Networking MACsec: sanity
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
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
        Issue: [aarch64][coresight_etm4x][kernel 5.19.0] coresight-etm4x: p=
robe of ARMHC500:20 failed with error -17
            URL: https://lore.kernel.org/all/CA+QYu4ogiTa1V20aqxFqBrMH0z927=
YNNN2O=3DCKma+=3DM_8E81iQ@mail.gmail.com/
            Affected tests:
                 aarch64 - Boot test
        Issue: gcc: error: unrecognized command-line option =E2=80=98-Qunus=
ed-arguments=E2=80=99
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/513
            Affected tests:
                 aarch64 - Firmware test suite
        Issue: Firmware test suite: modinfo: ERROR: Module efi_runtime not =
found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1235
            Affected tests:
                 aarch64 - Firmware test suite
        Issue: Firmware test suite: FAIL: /usr/share/beakerlib/testing.sh: =
line 896: fwts: command not found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1486
            Affected tests:
                 aarch64 - Firmware test suite



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

