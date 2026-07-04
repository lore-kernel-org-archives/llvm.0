Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CA934DCC8
	for <llvm@lists.linux.dev>; Sat,  4 Jul 2026 05:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783144334; cv=none; b=nfs1RhuadOcsNhy7SXecIzGPJYvxB650tRtHVwa3KQfhaALqaFkWYzeN7paZi6/mQEsmH7ZlZvKky4+9tpGMYL+h+/LZykCbCU55saO/76i5DreRRkzrypvg9Q84Ct47f6mmXr+63Zs4tDi2FXyp36DPZgu5BKGktMdiBA52VTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783144334; c=relaxed/simple;
	bh=nVskbsQy/EKjO6L99VKDfee2Pw53Z/sRsr0MK1C9Q+s=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=aihD8kRtdy82bfUE9KfGWOJ1ip1WkisItvj6t/GsfzEYmDBKdaNHta77my8YJFRfMeEnU3qb1MvFiG5cF28tFLnabZlJ1XOJfQUGo6DcyDnIxZd+40omZp7e5O6DsrxWFBb+QlIGX9jnIPnsxj26AvDO/jT9Hmz7qheg3513IaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Se7K4yUz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Se7K4yUz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783144331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K+A2P7zvJQo+qoQx6BPYuvbxzJvNxTIhOmGe+vt34tI=;
	b=Se7K4yUzSD5uUN0giB/0b9x93dvgWSIkrOXAtMHKvg6p7iZDmtbYcNbkZvKPSwaEOVufJ4
	FoudbJ2VUjKXVLzQ8RnUba+pabaQC74YE7hOl+xPrd4hnY0vZai1FP38wt2tXilhpbcyyV
	C7lS5IeIKfNl0z2Sm7THIp+Zk0FA+7M=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-33-rzs_9C9MMt--pt-rkUhH_w-1; Sat,
 04 Jul 2026 01:52:09 -0400
X-MC-Unique: rzs_9C9MMt--pt-rkUhH_w-1
X-Mimecast-MFC-AGG-ID: rzs_9C9MMt--pt-rkUhH_w_1783144328
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 469561800593
	for <llvm@lists.linux.dev>; Sat,  4 Jul 2026 05:52:08 +0000 (UTC)
Received: from [172.20.209.159] (unknown [10.30.45.50])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D560F36F2E;
	Sat,  4 Jul 2026 05:52:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc1,
 upstream-mainline, d2c9a991)
Date: Sat, 04 Jul 2026 05:52:07 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <10429.126070401520900319@us-mta-33.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _cQldZ6sGs7Cg_mfcXIdewtgFRLRYjnTSwx00xFweIQ_1783144328
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'device-id-rework' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/ukleinek/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2650674073

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2650674073_ppc64le_kernel

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

