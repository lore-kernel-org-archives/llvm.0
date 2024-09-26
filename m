Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AAC374EA
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360199; cv=none; b=ZSsEKaarCbZ8PdQ4YJ3NXwOBfg/3b3Z3pxwJjiGeZOY13FlU0f0YvwBHM8pslYap3b2lGDbx27sxMSPdw/KxkuYWv5ys1hcGesHSNhvEmGWB/bA0dzYlo/O0svA3dkLcjzI1KRYAFQQ9TFzMGzMfoLDoOg4kO4YfyTPvXlPeWzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360199; c=relaxed/simple;
	bh=fAFoZiN3Qjaf/f1Fjgy8oLcVk8f5R70ChOXUDBEhaE4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=RptoTyYyR0HIeEBz0/3PlA9NGwO81BP3M9BVS3ewpZkiuSObkwNTNOdIxHG6CIepptufIcd1RPjWTAnKNJLGkTyeFR4zkmgFmtNEchF9qqi0hgWN6pLLsRIFjgLig9WIjXsSUw6GvvPZxvu096Je58D80B+0x+1O4OQbczLQ1S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bt+L7SHv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bt+L7SHv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H4bgs9stkkGgAYtdvtyd67ePqd7cisiWkCxnNsvG204=;
	b=Bt+L7SHvFokCxNAHAqbM5dq8GlpE3W+sBObH0nOaYr821NBEepp3PPdpKgWvvaxJzzRzvn
	GZdkihKVKsCuZighCK6eCILQm5dmKPOur8iFAb6gO2HJ9pUcJoBmoV1HZZXsMuGAYA1hZ8
	EzxYBnq/eRnDLKWZ9p05VmayIh08hlI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-636-TYd7SU2RMY2c7bbJCXjSOg-1; Thu,
 26 Sep 2024 10:16:36 -0400
X-MC-Unique: TYd7SU2RMY2c7bbJCXjSOg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6212518F38C6
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:16:35 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2D8711979064;
	Thu, 26 Sep 2024 14:16:35 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc7,
 mainline.kernel.org-clang, 5da02886)
Date: Thu, 26 Sep 2024 14:16:35 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <05100.124092610163611026@us-mta-636.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'wq-for-6.11-rc7-fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/tj/wq

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1451463022

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1451463022-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1451463022-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1451463022-x86_64-kernel-debug


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

