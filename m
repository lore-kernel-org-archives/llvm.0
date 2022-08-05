Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0CCA3C
	for <llvm@lists.linux.dev>; Fri,  5 Aug 2022 07:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659685908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=co7HX+T+IPb5iZX9lqeIYHNty5j3ETa7uqL2O/pf40A=;
	b=UvODnwJO55XvBxjWNXghqmrx/2Mffa7BIp2t9FWnt1MCGl+HjGUlNIwpNlwPZdOI8XUW/+
	tYd9M/h+3EsihkbMYRbYu1KSps2L0TdZZBcu1YeEmq3sEqY1pvpR3xn2aRWgLRlaVdQ6jf
	UEd2q66nq2aly1ne8psWEq0FICTRg2c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-qILA6uo7POyx175pwv4n4g-1; Fri, 05 Aug 2022 03:51:47 -0400
X-MC-Unique: qILA6uo7POyx175pwv4n4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA383802D1C
	for <llvm@lists.linux.dev>; Fri,  5 Aug 2022 07:51:46 +0000 (UTC)
Received: from [172.64.11.40] (unknown [10.30.32.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA41840149A8;
	Fri,  5 Aug 2022 07:51:46 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for 5.19.0
 (mainline.kernel.org-clang) [c1c76700]
Date: Fri, 05 Aug 2022 07:51:46 -0000
CC: bgoncalv@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Message-Id: <86971.122080503514700367@us-mta-222.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/49957

One or more kernel tests failed:

    Unrecognized or new issues:
         aarch64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4713277
         aarch64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4713282

    We also see the following known issues which are not related to your ch=
anges:
        Issue: gcc: error: unrecognized command-line option =E2=80=98-Qunus=
ed-arguments=E2=80=99
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/513
            Affected tests:
                 aarch64 - Firmware test suite
                  x86_64 - Firmware test suite
                  x86_64 (debug) - kselftest build - bpf
                  x86_64 (debug) - kselftest build - net
                  x86_64 (debug) - Firmware test suite
        Issue: kselftest build: /usr/include/gnu/stubs.h:7:11: fatal error:=
 'gnu/stubs-32.h' file not found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1222
            Affected tests:
                  x86_64 (debug) - kselftest build - bpf
                  x86_64 (debug) - kselftest build - net
        Issue: stress: stress-ng: fail to build core-affinity: error: redec=
laration of enum fsconfig_command
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1303
            Affected tests:
                 aarch64 - stress: stress-ng - cpu-cache
                 aarch64 - stress: stress-ng - memory
                   s390x - stress: stress-ng - cpu-cache
                   s390x - stress: stress-ng - memory
                  x86_64 - stress: stress-ng - cpu-cache
                  x86_64 - stress: stress-ng - memory
                  x86_64 (debug) - stress: stress-ng - cpu-cache
                  x86_64 (debug) - stress: stress-ng - memory
        Issue: Storage - blktests: fail to build mount_clear_sock: error: r=
edeclaration of enum fsconfig_command
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1300
            Affected tests:
                 aarch64 - Storage - blktests - blk
                 aarch64 - Storage - blktests - nvme-tcp
                 aarch64 - Storage - blktests - nvmeof-mp
                   s390x - Storage - blktests - blk
                   s390x - Storage - blktests - nvme-tcp
                   s390x - Storage - blktests - nvmeof-mp
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - blktests - nvme-tcp
                  x86_64 - Storage - blktests - nvmeof-mp
                  x86_64 (debug) - Storage - blktests - nvme-tcp
                  x86_64 (debug) - Storage - blktests - nvmeof-mp
        Issue: Storage block - storage fio numa: Performance comparison: mi=
n:40535 * 1.15 < max:81259
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032094
            Affected tests:
                  x86_64 (debug) - Storage - block - storage fio numa
        Issue: Networking MACsec: sanity: Cannot find device "dummy0"
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1306
            Affected tests:
                  x86_64 (debug) - Networking MACsec: sanity
        Issue: targetcli - module 'inspect' has no attribute 'getargspec'
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2102058
            Affected tests:
                 aarch64 - Storage - targetcli basic
                 ppc64le - Storage - targetcli basic
                   s390x - Storage - targetcli basic
                  x86_64 - Storage - targetcli basic
                  x86_64 (debug) - Storage - targetcli basic
        Issue: Podman system integration test: hit timeout
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/702
            Affected tests:
                  x86_64 (debug) - Podman system test - as root
        Issue: Podman: 170-run-userns.bats: FAIL: Check group leaked into u=
ser namespace
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1166
            Affected tests:
                 aarch64 - Podman system test - as root
                 ppc64le - Podman system test - as root
                  x86_64 - Podman system test - as root
                  x86_64 (debug) - Podman system test - as root
        Issue: Podman: 070-build.bats: Error: i01: image not known
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1309
            Affected tests:
                 ppc64le - Podman system test - as root
                 ppc64le - Podman system test - as user
                  x86_64 (debug) - Podman system test - as root
                  x86_64 (debug) - Podman system test - as user
        Issue: Firmware test suite: modinfo: ERROR: Module efi_runtime not =
found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1235
            Affected tests:
                 aarch64 - Firmware test suite
                  x86_64 - Firmware test suite
                  x86_64 (debug) - Firmware test suite
        Issue: SELinux prevents sendmail.service while running Memory funct=
ion: kaslr
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1169
            Affected tests:
                  x86_64 (debug) - kselftests upstream - net
        Issue: xfstests: fail to build detached_mounts_propagation: error: =
redeclaration of 'enum fsconfig_command'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1302
            Affected tests:
                 aarch64 - xfstests - ext4
                 aarch64 - xfstests - xfs
                 aarch64 - xfstests - btrfs
                  x86_64 - xfstests - ext4
                  x86_64 - xfstests - xfs
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 - xfstests - btrfs
                  x86_64 (debug) - xfstests - ext4
                  x86_64 (debug) - xfstests - xfs
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - btrfs
        Issue: Podman: 110-history.bats: FAIL: CreatedSince and CreatedAt f=
rom image history should =3D=3D image list
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1160
            Affected tests:
                 aarch64 - Podman system test - as root
                 aarch64 - Podman system test - as user
                 ppc64le - Podman system test - as root
                 ppc64le - Podman system test - as user
                   s390x - Podman system test - as root
                   s390x - Podman system test - as user
        Issue: storage: software RAID testing: SELinux prevents mdadm
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1213
            Affected tests:
                   s390x - Storage - swraid simple_reshape
        Issue: kdump - sysrq-c: vmcore-dmesg.txt is empty
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2101983
            Affected tests:
                   s390x - kdump - sysrq-c
                   s390x - kdump - file-load
        Issue: AMTU (Abstract Machine Test Utility): misc/amtu FAIL
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1162
            Affected tests:
                 ppc64le - AMTU (Abstract Machine Test Utility)
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: avc:  denied  { sys_admin } for  pid=3D674004 comm=3D"system=
d-gpt-aut" capability=3D21  scontext=3Dsystem_u:system_r:systemd_gpt_genera=
tor_t:s0 tcontext=3Dsystem_u:system_r:systemd_gpt_generator_t:s0 tclass=3Dc=
apability permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2083900
            Affected tests:
                 aarch64 - Networking cki netfilter test
                 aarch64 - ALSA PCM loopback test
                 aarch64 - Storage - SCSI VPD
                 aarch64 - Storage - software RAID testing
        Issue: Firmware test suite: (Kernel panic) __efi_rt_asm_wrapper+0x2=
c/0x4c
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1310
            Affected tests:
                 aarch64 - Firmware test suite


If you find a failure unrelated to your changes, please tag it at https://d=
atawarehouse.cki-project.org .
This will prevent the failures from being incorrectly reported in the futur=
e.
If you don't have permissions to tag an issue, you can contact the CKI team=
 or
test maintainers.

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

