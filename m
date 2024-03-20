Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE3F85955
	for <llvm@lists.linux.dev>; Wed, 20 Mar 2024 22:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710972705; cv=none; b=mSrkpPm8Y/1AIUAX76Geezv1GM5CIZb/n4IUtJAAswcirfwIRfHcB6BfWLckSS78aNCK/yVjf9sy9+RwxmNHxYOwJv0QyCnYvCey7Tv3hPDnw7WZMjSEew1lOH114A1aUsKFBeL59YhSIQgMklj0qPWBXjSd3gJZYo6sIqYygTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710972705; c=relaxed/simple;
	bh=//Ba2miybPBYG+4eMCLIAB1Kfbhy+ComJ9w5BrPqDF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RcXwUfCWTKO5v0Cp2zpKeww/czP/OJRBrYOIEeki23P4rgYUf6AT2dCsXoS1oJuKyOZdi4GDgQQIoIrvnt62YJn2T6+uL82a7lD/SaMbm/KJcwUmlWHaYwaSDjwCSVL5dLkAWBlXdlw3QYygJdkKQYtzYtB6kqn5Jj2+M/UZPPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oe1r8RVJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oe1r8RVJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91280C433C7;
	Wed, 20 Mar 2024 22:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710972704;
	bh=//Ba2miybPBYG+4eMCLIAB1Kfbhy+ComJ9w5BrPqDF0=;
	h=Date:From:To:Cc:Subject:From;
	b=Oe1r8RVJIk36iKScz6njtR8qBLjU3wW8XmiVPfxj8nd5z98Etruf8HVdnd6tcEHuG
	 SPHpczcrbikd8OV1PEHfa4X3hI+cKo8FaG8BKBYGzCE13gsU1NogRa5WMHqaFViJNk
	 d/2BfwN0gtN1lZIUJDO9WoDBqoeB6sgmTLyVHzCYSTLZB2hp/VVz32LOmkQBg9N0Ss
	 KZCW5p45ihov7j9RKPlgdXuzi1Q6BSgjMINgdeIHXSC7rYeJga2sPLvxm5SkTdZ6F1
	 2jFF6zapXYOSfzYl/gBbS1YMDjYs5pc4YPi4+3L9sL5cuoegjiTcun8GdPXExztt8O
	 7Lf+aeETxV7fg==
Date: Wed, 20 Mar 2024 15:11:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev
Cc: keescook@chromium.org
Subject: New meeting link
Message-ID: <20240320221142.GA162232@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Starting with the April 3rd ClangBuiltLinux meeting, there is a new
meeting link [1]. The old link [2] will no longer work. The
ClangBuiltLinux project page [2] will be updated shortly [4]. I believe
Kees added every one that was on the original invite but it should be
easier for people outside of Google to join now and it can be added to
your own calendar through the calendar link on the project page.

[1]: https://meet.google.com/wrr-mxkn-hdo
[2]: https://meet.google.com/yjf-jyqk-iaz
[3]: https://ClangBuiltLinux.github.io
[4]: https://github.com/ClangBuiltLinux/ClangBuiltLinux.github.io/pull/68

Cheers,
Nathan
