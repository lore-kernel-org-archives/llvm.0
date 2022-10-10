Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B041F7E
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 12:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665403625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GIS0qUHbTIVFxnEEcaltfM7WAM7jqmLcrwQy+W9C5OQ=;
	b=aaDWbz/PJwWLQV28Ziulo4BEkdBZ6cTAHxuYFJ7UwCuCxzsi3lmbMjjvXnEP4VwHgfWotw
	RnImh5VFTUe1wwnbapT7RLrtofQvN87cUdrtjJBLB9gMVRZZf1YdKvsu/mhq025lKNBGZG
	ouU+suZ44rzt05ihjK+0cU1KH1amB08=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-CvjFEn73NcCPgBhY0w5uzw-1; Mon, 10 Oct 2022 08:07:04 -0400
X-MC-Unique: CvjFEn73NcCPgBhY0w5uzw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8260C862FE1
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 12:07:04 +0000 (UTC)
Received: from [172.64.5.34] (unknown [10.30.33.126])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 473BD145BEE5;
	Mon, 10 Oct 2022 12:07:04 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.0.0,
 mainline.kernel.org-clang, a6afa419)
Date: Mon, 10 Oct 2022 12:07:02 -0000
CC: czhong@redhat.com, yiche@redhat.com, mm-qe@redhat.com, jiyin@redhat.com,
 xifeng@redhat.com, guazhang@redhat.com, jbastian@redhat.com, ffan@redhat.com,
 jstancek@redhat.com, xzhou@redhat.com, haliu@redhat.com, yizhan@redhat.com,
 jkysela@redhat.com, jiji@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Message-Id: <52364.122101008070400575@us-mta-91.us.mimecast.lan>
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
    Commit message: Merge tag 'mailbox-v6.1' of git://git.linaro.org/landin=
g-teams/working/fujitsu/integration

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/55672

One or more kernel tests failed:
    =E2=9D=97 Regression(s) detected:
          x86_64 - stress: stress-ng - cpu-cache
                   Issue: stress: stress-ng - cpu: perf: interrupt took too=
 long
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1034
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433155

    Unrecognized or new issues:
         aarch64 - Storage - software RAID testing
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433290
         aarch64 - stress: stress-ng - cpu-cache
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433292
         aarch64 - stress: stress-ng - memory
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433293
         aarch64 - Storage - blktests - nvmeof-mp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433299
         aarch64 - LTP: openposix test suite
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433307
         aarch64 - CIFS Connectathon
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433308
         aarch64 - Networking: igmp conformance test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433319
         aarch64 - Networking cki netfilter test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433325
         aarch64 - ALSA PCM loopback test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433336
         aarch64 - Storage - SCSI VPD
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433342
         aarch64 - xfstests - ext4
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433364
         aarch64 - xfstests - xfs
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433365
           s390x - stress: stress-ng - cpu-cache
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433064
           s390x - stress: stress-ng - memory
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433065
           s390x - Storage - blktests - nvmeof-mp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433070
           s390x - LTP: openposix test suite
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433075
           s390x - CIFS Connectathon
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433076
           s390x - Networking cki netfilter test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433091
          x86_64 - Storage - software RAID testing
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433152
          x86_64 - Storage - swraid scsi_raid
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433153
          x86_64 - stress: stress-ng - memory
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433157
          x86_64 - Storage - blktests - nvmeof-mp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433168
          x86_64 - LTP: openposix test suite
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433182
          x86_64 - CIFS Connectathon
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433184
          x86_64 - Networking: igmp conformance test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433205
          x86_64 - Networking cki netfilter test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433216
          x86_64 - ALSA PCM loopback test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433238
          x86_64 - Storage - SCSI VPD
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433248
          x86_64 - xfstests - ext4
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433275
          x86_64 - xfstests - xfs
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5433276
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432997

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
                 aarch64 - Storage - blktests - blk
                   s390x - Storage - blktests - blk
                  x86_64 - Storage - blktests - blk
        Issue: Storage block - storage fio numa: Performance comparison: mi=
n:40535 * 1.15 < max:81259
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032094
            Affected tests:
                  x86_64 - Storage - block - storage fio numa
        Issue: Networking route: pmtu: Cannot find device "veth0_client"
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1346
            Affected tests:
                 aarch64 - Networking bridge: sanity
                   s390x - Networking bridge: sanity
                  x86_64 - Networking bridge: sanity
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
        Issue: Storage blktests - blk: scsi/007: Reading from scsi_debug fa=
iled
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2027550
            Affected tests:
                   s390x - Storage - blktests - blk
        Issue: kdump - sysrq-c: ERROR: No vmcore-dmesg.txt saved in /var/cr=
ash
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1339
            Affected tests:
                 aarch64 - kdump - sysrq-c
                   s390x - kdump - sysrq-c
                   s390x - kdump - file-load
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

