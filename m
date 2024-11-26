Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7A11CDA2F
	for <llvm@lists.linux.dev>; Tue, 26 Nov 2024 23:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732663328; cv=none; b=amWl5xADxkXd1q9W31lWrWbRFDJPYOiuuo5LR7XW8ZAirlsGaFmFOHMl4nfraRcFg0FCSWWlqA3jvh65UNN79ylxk9KK9MfEblGSyeOnJYUO2Vl3NgdM5Buu94YB3pXh1sWNW09RxklBCTBOj7apRNbvZUq3IvVmt9lRkx7I1ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732663328; c=relaxed/simple;
	bh=SVqyQO/CAsVZNenkdVPQ+sow/xb3zDxlVRFQVjFgGBU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=b26BU7YQlNyX8YgEB6t3ono2aTEPyeUNB1AuhZFo3iwseUgWkQJJKuyN374eXFQiA3Gw/oCyxZLsjAb8M4raQHzSSJV3qh1RZYQk2YsEaTY732O8p4dmrnL4/Njof7dMf8QquY4SKmPQxD95/x6L1JWBTn8UJb5i0bqZXP41zW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NyrT4iNO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NyrT4iNO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732663325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BXbYUqMf2klw1au9muZb86S0rTBrHb4PiXhhqpcKe/U=;
	b=NyrT4iNO/ohSPkeLK9/jWNd1139Igt+ZSTsYD/okKNuz+BsXVKfIQhxHRriID9U7YqqYgJ
	fTM/XZ9RpS7gvGWdgrJm+QOQbKoVdXU6k325Qtm5gOmwouRPu1hgMGMsZPmHZN75m4cpLf
	Ioky/6blJx3bu6wd5Id3myrtVX82LtA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-670-8BW3NeWJNfWiTNB_OPrv3w-1; Tue,
 26 Nov 2024 18:22:04 -0500
X-MC-Unique: 8BW3NeWJNfWiTNB_OPrv3w-1
X-Mimecast-MFC-AGG-ID: 8BW3NeWJNfWiTNB_OPrv3w
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 172421955E87
	for <llvm@lists.linux.dev>; Tue, 26 Nov 2024 23:22:03 +0000 (UTC)
Received: from [172.64.13.40] (unknown [10.30.32.164])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B3E8F195E485;
	Tue, 26 Nov 2024 23:22:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0,
 upstream-mainline, 798bb342)
Date: Tue, 26 Nov 2024 23:22:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <11701.124112618220400321@us-mta-670.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oQOlfBHvl7VhDIHv2nr5IWzwmvmzcv2vbIbKhgPep20_1732663323
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'rust-6.13' of https://github.com/Rust-for-Li=
nux/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1561709539

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1561709539-ppc64le-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1561709539-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1561709539-x86_64-kernel-debug


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

