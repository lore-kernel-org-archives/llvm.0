Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C0C27718
	for <llvm@lists.linux.dev>; Wed,  2 Nov 2022 21:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667424702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mTaMiw8SOlcbNuTA6GM1qp0APVLwOb95pH57r6UKY/M=;
	b=L3Ku5LZKPez4hMOwApy2NnL1i8nxCBGXJzHezMAZsJmCVIkxt9uMbo9FKJd1lXY6ZdywTW
	Y/DnN/uy30DsKRJYP8/ANe6lfeuKZbPFThG+4Z/sDxziY8dVoi2zBMFiTF78IGavX3iXyv
	h2wfVql3d9AOuycJNm3nLqdr57sPNlI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-_qQzx-yeMOmfd6EsbIdziQ-1; Wed, 02 Nov 2022 17:31:41 -0400
X-MC-Unique: _qQzx-yeMOmfd6EsbIdziQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFF0F101A5AD
	for <llvm@lists.linux.dev>; Wed,  2 Nov 2022 21:31:40 +0000 (UTC)
Received: from [172.64.9.44] (unknown [10.30.34.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D70F1111CB82;
	Wed,  2 Nov 2022 21:31:40 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.1.0-rc3,
 mainline.kernel.org-clang, 54917c90)
Date: Wed, 02 Nov 2022 21:31:40 -0000
CC: bgoncalv@redhat.com
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Message-Id: <55097.122110217314100899@us-mta-379.us.mimecast.lan>
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
    Commit message: Merge tag 'nolibc-urgent.2022.10.28a' of git://git.kern=
el.org/pub/scm/linux/kernel/git/paulmck/linux-rcu

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/58275

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 (debug) - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5768506

    We also see the following known issues which are not related to your ch=
anges:
        Issue: kselftest build - bpf: tools/include/uapi/linux/in.h:199:3: =
error: type name requires a specifier or qualifier
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1451
            Affected tests:
                  x86_64 (debug) - kselftest build - bpf
        Issue: RIP: 0010:ahd_init.cold+0x96/0x98 [aic79xx]
            URL: https://lore.kernel.org/all/CA+QYu4qTtXgVegAd7S5bjJQye+kmt=
PaFau4dg3YPU2tH9faBjg@mail.gmail.com/T/#u
            Affected tests:
                  x86_64 (debug) - Boot test
        Issue: (upstream) Cannot download, all mirrors were already tried w=
ithout success
            URL: https://datawarehouse.cki-project.org/kcidb/tests/5439024
            Affected tests:
                  x86_64 (debug) - LTP: openposix test suite
                  x86_64 (debug) - CIFS Connectathon
        Issue: [rawhide] avc:  denied  { write } for  pid=3D173647 comm=3D"=
systemd-gpt-aut" name=3D"vda" dev=3D"devtmpfs" ino=3D321 scontext=3Dsystem_=
u:system_r:systemd_gpt_generator_t:s0 tcontext=3Dsystem_u:object_r:fixed_di=
sk_device_t:s0 tclass=3Dblk_file
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2134121
            Affected tests:
                 aarch64 - Storage - blktests - blk
                 aarch64 - Storage - software RAID testing
                 aarch64 - stress: stress-ng - cpu-cache
                 aarch64 - stress: stress-ng - memory
                 aarch64 - Storage - blktests - nvmeof-mp
                 aarch64 - LTP: openposix test suite
                 aarch64 - CIFS Connectathon
                 aarch64 - Networking bridge: sanity
                 aarch64 - Networking MACsec: sanity
                 aarch64 - Networking: igmp conformance test
                 aarch64 - Networking cki netfilter test
                 aarch64 - ALSA PCM loopback test
                 aarch64 - Storage - SCSI VPD
                 aarch64 - Firmware test suite
                 aarch64 - xfstests - ext4
                 aarch64 - xfstests - xfs
                 aarch64 - xfstests - btrfs
                 ppc64le - LTP: openposix test suite
                 ppc64le - CIFS Connectathon
                 ppc64le - Networking bridge: sanity
                 ppc64le - Networking MACsec: sanity
                 ppc64le - Networking cki netfilter test
                 ppc64le - ALSA PCM loopback test
                   s390x - Storage - blktests - blk
                   s390x - stress: stress-ng - cpu-cache
                   s390x - stress: stress-ng - memory
                   s390x - Storage - blktests - nvmeof-mp
                   s390x - LTP: openposix test suite
                   s390x - CIFS Connectathon
                   s390x - Networking bridge: sanity
                   s390x - Networking MACsec: sanity
                   s390x - Networking cki netfilter test
                  x86_64 - Storage - blktests - nvmeof-mp
                  x86_64 - LTP: openposix test suite
                  x86_64 - CIFS Connectathon
                  x86_64 - Networking bridge: sanity
                  x86_64 - Networking MACsec: sanity
                  x86_64 - Networking: igmp conformance test
                  x86_64 - Networking cki netfilter test
                  x86_64 - ALSA PCM loopback test
                  x86_64 - Storage - SCSI VPD
                  x86_64 - xfstests - ext4
                  x86_64 - xfstests - xfs
                  x86_64 - xfstests - btrfs
                  x86_64 (debug) - LTP: openposix test suite
                  x86_64 (debug) - CIFS Connectathon
                  x86_64 (debug) - Networking: igmp conformance test
                  x86_64 (debug) - Networking route: pmtu
                  x86_64 (debug) - Storage - SCSI VPD
                  x86_64 (debug) - xfstests - ext4
                  x86_64 (debug) - xfstests - xfs
                  x86_64 (debug) - xfstests - btrfs
        Issue: Networking socket: fuzz: hit test timeout
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1449
            Affected tests:
                  x86_64 (debug) - Networking socket: fuzz
        Issue: selftests: net: psock_snd.sh: Resource temporarily unavailab=
le
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/914
            Affected tests:
                  x86_64 (debug) - kselftests upstream - net
        Issue: kselftests upstream: FAIL: do_net_forwarding_config
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1318
            Affected tests:
                  x86_64 (debug) - kselftests upstream - forwarding
        Issue: kselftests upstream - tc: FAIL: do_tc-testing_config
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1319
            Affected tests:
                  x86_64 (debug) - kselftests upstream - tc
        Issue: kselftests upstream - bpf_test_progs: FAIL: Command 'do_bpf_=
test_progs_run' (Expected 0, got 1)
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1322
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: selinux-policy: serge-testsuite: hit test timeout, aborting =
it...
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1110
            Affected tests:
                  x86_64 (debug) - selinux-policy: serge-testsuite
        Issue: xfstests - nfsv4.2: RIP: 0010:nfs_init_fs_context+0x2a8/0x2f=
0
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1419
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: Storage - blktests - blk: nvme/012: ISOFS: unsupported/inval=
id hardware sector size 4096
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1375
            Affected tests:
                 aarch64 - Storage - blktests - blk
                   s390x - Storage - blktests - blk
                  x86_64 - Storage - blktests - blk
        Issue: Storage blktests - blk: scsi/007: Reading from scsi_debug fa=
iled
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2027550
            Affected tests:
                  x86_64 - Storage - blktests - blk
        Issue: Storage block - storage fio numa: Performance comparison: mi=
n:40535 * 1.15 < max:81259
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032094
            Affected tests:
                 aarch64 - Storage - block - storage fio numa
                  x86_64 - Storage - block - storage fio numa
        Issue: Networking route: pmtu: Cannot find device "veth0_client"
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1346
            Affected tests:
                 aarch64 - Networking bridge: sanity
                 aarch64 - Networking MACsec: sanity
                 ppc64le - Networking bridge: sanity
                 ppc64le - Networking MACsec: sanity
                   s390x - Networking bridge: sanity
                   s390x - Networking MACsec: sanity
                  x86_64 - Networking bridge: sanity
                  x86_64 - Networking MACsec: sanity
        Issue: Networking MACsec: sanity: Cannot find device "dummy0"
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1306
            Affected tests:
                 aarch64 - Networking MACsec: sanity
                 ppc64le - Networking MACsec: sanity
                   s390x - Networking MACsec: sanity
                  x86_64 - Networking MACsec: sanity
        Issue: kdump - sysrq-c: ERROR: No vmcore-dmesg.txt saved in /var/cr=
ash
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1339
            Affected tests:
                 aarch64 - kdump - sysrq-c
                   s390x - kdump - sysrq-c
                   s390x - kdump - file-load
                  x86_64 - kdump - sysrq-c
                  x86_64 - kdump - file-load
        Issue: [rawhide][s390x] avc:  denied  { transition } for  pid=3D135=
5 comm=3D"runcon" path=3D"/usr/bin/true" dev=3D"dm-0" ino=3D17226318 sconte=
xt=3Dsystem_u:system_r:unconfined_service_t:s0 tcontext=3Dunconfined_u:unco=
nfined_r:unconfined_t:s0-s0:c0.c1023 tclass=3Dprocess permissive=3D1
            URL: https://datawarehouse.cki-project.org/kcidb/tests/5628421
            Affected tests:
                   s390x - Boot test
                   s390x - Reboot test
        Issue: stress: stress-ng - memory: system hit OOM
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1425
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

