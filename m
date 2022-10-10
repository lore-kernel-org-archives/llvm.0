Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150927E
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 12:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665403298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=17RSGxmrU8v3nWLqWZ9UVnJ6AGQHchVzslHGXt0KlpQ=;
	b=FmdP8W9OyNFLA0wJRwmKjV1ekDa8gT2ig3xpAi2NbjzyUOd3r5kUdW2BcY0+co9w9pHqyN
	gLiTbjI9ZqX3SYqekJK78TzxKKhOg60V0GL3n6c2w51lF1imOYV/NckaRMXl0TxqHLY7KJ
	i/QRdq5TzyU90DIHe/Oku0rG9yP09rw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-3z0ZkJ7fNxW63m5W1q5fbQ-1; Mon, 10 Oct 2022 08:01:37 -0400
X-MC-Unique: 3z0ZkJ7fNxW63m5W1q5fbQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F8F81C09C8A
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 12:01:37 +0000 (UTC)
Received: from [172.64.5.34] (unknown [10.30.33.126])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 15915492B04;
	Mon, 10 Oct 2022 12:01:37 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.0.0,
 mainline.kernel.org-clang, 493ffd66)
Date: Mon, 10 Oct 2022 12:01:36 -0000
CC: bgoncalv@redhat.com, yiche@redhat.com, mm-qe@redhat.com, jiyin@redhat.com,
 xifeng@redhat.com, guazhang@redhat.com, jbastian@redhat.com, ffan@redhat.com,
 jstancek@redhat.com, xzhou@redhat.com, haliu@redhat.com, yizhan@redhat.com,
 jkysela@redhat.com, jiji@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Message-Id: <87551.122101008013701447@us-mta-122.us.mimecast.lan>
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
    Commit message: Merge tag 'ucount-rlimits-cleanups-for-v5.19' of git://=
git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/55700

One or more kernel tests failed:
    =E2=9D=97 Regression(s) detected:
           s390x - stress: stress-ng - memory
                   Issue: stress: stress-ng - memory: ERROR: Aborting curre=
nt task: Aborting due to system crash and reboot
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1236
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437029
          x86_64 - stress: stress-ng - cpu-cache
                   Issue: stress: stress-ng - cpu: perf: interrupt took too=
 long
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1034
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437087

    Unrecognized or new issues:
         aarch64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437247
         aarch64 - Storage - blktests - nvmeof-mp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437263
         aarch64 - LTP: openposix test suite
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437271
         aarch64 - CIFS Connectathon
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437272
         aarch64 - Networking: igmp conformance test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437283
         aarch64 - Networking cki netfilter test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437289
         aarch64 - ALSA PCM loopback test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437300
         aarch64 - Storage - SCSI VPD
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437306
         aarch64 - xfstests - ext4
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437328
         aarch64 - xfstests - xfs
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437329
           s390x - stress: stress-ng - cpu-cache
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437028
           s390x - Storage - blktests - nvmeof-mp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437034
           s390x - LTP: openposix test suite
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437039
           s390x - CIFS Connectathon
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437040
           s390x - Networking cki netfilter test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437055
          x86_64 - Storage - software RAID testing
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437083
          x86_64 - stress: stress-ng - memory
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437089
          x86_64 - Storage - blktests - nvmeof-mp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437102
          x86_64 - LTP: openposix test suite
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437114
          x86_64 - CIFS Connectathon
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437115
          x86_64 - Networking: igmp conformance test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437126
          x86_64 - Networking cki netfilter test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437132
          x86_64 - ALSA PCM loopback test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437144
          x86_64 - Storage - SCSI VPD
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437150
          x86_64 - xfstests - ext4
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437177
          x86_64 - xfstests - xfs
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5437178
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5436569

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] RIP: 0010:clmul_polyval_update+0x3e9/0x5d0 [polyv=
al_clmulni]
            URL: https://lore.kernel.org/all/CA+QYu4oK8D-89QZnBC8eYS9TxOU48=
hY5JazTvF=3D4N2qdeRepbw@mail.gmail.com/
            Affected tests:
                  x86_64 (debug) - Boot test
        Issue: Storage - blktests - blk: nvme/012: ISOFS: unsupported/inval=
id hardware sector size 4096
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1375
            Affected tests:
                   s390x - Storage - blktests - blk
                  x86_64 - Storage - blktests - blk
        Issue: Storage blktests - blk: scsi/007: Reading from scsi_debug fa=
iled
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2027550
            Affected tests:
                   s390x - Storage - blktests - blk
                  x86_64 - Storage - blktests - blk
        Issue: Networking route: pmtu: Cannot find device "veth0_client"
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1346
            Affected tests:
                 aarch64 - Networking bridge: sanity
                   s390x - Networking bridge: sanity
                  x86_64 - Networking bridge: sanity
        Issue: Storage - swraid simple_reshape: BUG bio-152 (Not tainted): =
Objects remaining in bio-152 on __kmem_cache_shutdown()
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1255
            Affected tests:
                  x86_64 - Storage - swraid simple_reshape
        Issue: Storage - swraid simple_reshape: (panic) RIP: 0010:mempool_f=
ree+0x53/0x80
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1359
            Affected tests:
                  x86_64 - Storage - swraid simple_reshape
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
        Issue: xfstests - nfsv4.2: RIP: 0010:nfs_init_fs_context+0x2a8/0x2f=
0
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1419
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
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

