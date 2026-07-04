Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BF313C918
	for <llvm@lists.linux.dev>; Sat,  4 Jul 2026 03:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783135938; cv=none; b=bv26d47KcXW+GzxE5K9fzicqlZ9Dqt2Hj9u/7LuSbaaal0/YOyZbHucbZER3fHKNzBzjwXCmdYl/VSCOKUlraH7sb2x8REbKA7EwZYnD9HDvSop6aNq1wwaBz31qq12FG9drHEfM7r9DRPTXueK/AWUDZcNXeeJlBNkYsDvJgqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783135938; c=relaxed/simple;
	bh=CR+l5V/8zuaHxbxXKbEGGAiLVBy1B9BkIYp1IRPm5LE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=iTEbaYpBQ4Sb4M4zJqcVTrNLYanmByRkXJXgyOCk7N2QO03JyPnmIQvMQLbSnHAjjycBropntgIffGNY3B7V2Aq+B4zdp+XMn7XT4sYdazEvphadmXBNuWqJeYVo/WSLj5ifmaf0249vIITeO2Kjr9Sbu04kteqkUXcsBLdDg+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FTQlTKO3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FTQlTKO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783135935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XfCuCRK362VNz/3/pK40OI9ciGq4wba6Xs1q01pe5PI=;
	b=FTQlTKO3SlQSIltF885E+vB2xzzAkvxgz1e4f/43LwSPTY6+IgIvUDwJKx6uIwgwUUv9br
	S9l91Hj2Bi5e87hadXNDKz2mc10hu2TjnjgD0g5MnbrbXUT94zYSnTirP8qOQnsSjb7IP+
	hu/zR3hXwLkkr9XzJYo/gnEQm+GQifg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-461-ai6059q3MvyX7FzwDzSemg-1; Fri,
 03 Jul 2026 23:32:14 -0400
X-MC-Unique: ai6059q3MvyX7FzwDzSemg-1
X-Mimecast-MFC-AGG-ID: ai6059q3MvyX7FzwDzSemg_1783135933
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0400B1944D3E
	for <llvm@lists.linux.dev>; Sat,  4 Jul 2026 03:32:13 +0000 (UTC)
Received: from [172.20.209.159] (unknown [10.30.45.50])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7CE561944B29;
	Sat,  4 Jul 2026 03:32:12 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc1,
 upstream-mainline, 71dfdfb0)
Date: Sat, 04 Jul 2026 03:32:12 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <43807.126070323321400195@us-mta-461.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NWcrHpFwq9MPXjAz--8JsvxNopVMNntg3hbZ2HjPnVI_1783135933
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'vfs-7.2-rc2.fixes' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/vfs/vfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2650497086

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2650497086_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]



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

